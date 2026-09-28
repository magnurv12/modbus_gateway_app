# Supervisório Modbus

App Flutter (SCADA mobile) que dá vida ao
[esp32-modbus-gateway](https://github.com/magnurv12/esp32-modbus-gateway):
monitora sensores, comanda atuadores, gerencia alarmes e explora qualquer
registrador Modbus pelo celular — via REST (`/api/*`) e WebSocket (`/ws`).

A planta de demonstração é uma **estação de bombeamento de água** (EB-01):
reservatório com chaves de nível, motobomba com inversor, válvula de
recalque e painel elétrico com medidor de energia.

## Telas

| Aba | O que mostra | Recursos do gateway usados |
|---|---|---|
| **Planta** | KPIs, cards por equipamento com valores ao vivo, sparklines e estado | `ws /ws` (snapshot + update) |
| ↳ **Equipamento** | Sinótico (tanque animado, rotor girando), tendência com linhas de alarme, medições com gauge ISA-101, status, comandos com confirmação e setpoints | `PUT /api/coils/{a}` (FC 05), `PUT /api/holding/{a}` (FC 06) |
| **Alarmes** | Lista ISA-18.2 (ativo / normalizado / reconhecido), filtros, resumo por severidade, deslizar para reconhecer | derivado das tags ao vivo |
| **Explorador** | Leitura/escrita crua de qualquer tabela, FC, latência, numeração legada (40001), hex/binário, leitura contínua, log de transações | `GET /api/{table}` (FC 01–04), `PUT` |
| **Gateway** | Enlace Modbus, contadores, carga do barramento, clientes WS, Wi-Fi, firmware, motivo do último reset | `GET /api/health` |

## Como rodar

```bash
flutter pub get
dart run build_runner build      # gera *.freezed.dart / *.g.dart

# Sem hardware: simulador embutido com física de processo
flutter run --dart-define=ENVIRONMENT=demo

# Com o ESP32 na mesma rede
flutter run                      # ENVIRONMENT=dev (padrão)
```

> **Android e `.local`:** nem todo Android resolve mDNS. Se aparecer
> "Gateway inacessível", troque `BASE_URL` em `assets/env/env_dev.yaml`
> pelo IP mostrado no monitor serial / `GET /api/health`.

Qualidade:

```bash
flutter analyze   # 0 issues
flutter test      # domínio, data, view models e smoke test com o simulador
```

## Ambientes (`assets/env/*.yaml`)

O `--dart-define=ENVIRONMENT=<nome>` escolhe **qual** YAML carregar; os
valores ficam no arquivo (versionado de propósito — não há segredos).

| Chave | Para quê |
|---|---|
| `BASE_URL` | `http://modbus-gateway.local` (ou o IP) |
| `WS_PATH` | `/ws` |
| `REQUEST_TIMEOUT_MS` | Precisa ser **maior** que os ~2 s que o ModbusMaster leva para desistir de um escravo mudo, senão o app nunca vê o `504` |
| `DEFAULT_SLAVE` | Escravo inicial do explorador |
| `LIVE_INTERVAL_MS` | `intervalMs` das assinaturas WebSocket |
| `HEALTH_REFRESH_MS` | Atualização automática da aba Gateway |
| `USE_SIMULATOR` | `true` troca os datasources pelo simulador |

## Mapa de tags (`assets/plant/plant.yaml`)

Toda a planta — equipamentos, endereços, tipos, escalas, faixas e alarmes —
vem de um YAML. Para supervisionar **o seu** escravo, edite o arquivo; nenhuma
linha de código muda.

```yaml
- id: p101_freq
  name: "Frequência"
  table: input          # holding | input | coils | discrete
  address: 5            # base 0 (40001 do manual = holding 0)
  type: uint16          # int16 | uint32 | int32 | float32 | bool
  wordOrder: big        # só p/ 32 bits: big | little (word swap)
  scale: 0.1            # engenharia = bruto * scale + offset
  unit: "Hz"
  min: 0
  max: 60
  alarms:
    - { when: above, limit: 58, severity: high, message: "Sobrevelocidade" }
```

O parser valida tudo e aponta o caminho exato do erro
(`equipments[1].tags[3].table: valor "holdin" inválido`), que aparece na
tela em vez de um crash.

## Mapa Modbus do simulador / escravo de referência

| Tabela | End. | Tag | Escala |
|---|---|---|---|
| input | 0 | Nível TQ-01 | ×0,1 % |
| input | 1 | Pressão de recalque | ×0,01 bar |
| input | 2 | Vazão | ×0,1 m³/h |
| input | 3 | Temperatura do motor | ×0,1 °C |
| input | 4 | Corrente do motor | ×0,1 A |
| input | 5 | Frequência | ×0,1 Hz |
| input | 6–7 | Energia (uint32, palavra alta primeiro) | ×0,1 kWh |
| input | 8 | Potência ativa | ×0,1 kW |
| holding | 0 | Setpoint de frequência | ×0,1 Hz |
| holding | 1 / 2 | Nível liga / desliga (auto) | ×0,1 % |
| holding | 3 | Rampa | s |
| coils | 0 / 1 / 2 / 3 | Bomba / Válvula / Auto / Reset (pulso) | — |
| discrete | 0–5 | Operando, Falha inversor, LSH, LSL, Porta, Emergência | — |

Qualquer escravo Modbus RTU com esse mapa (um CLP, um Arduino com
`ModbusRTUSlave`, ou `pymodbus` num PC com adaptador USB-RS485) faz a demo
funcionar com o hardware real.

## Roteiro de demonstração (≈ 3 min)

1. **Planta ao vivo** — o tanque enche; em automático a P-101 parte no nível
   máximo (rotor gira, frequência sobe na rampa).
2. **Comando com confirmação** — na XV-101, feche a válvula. O switch só
   muda quando o escravo confirma (o app nunca "finge" o estado).
3. **Evento anormal** — bomba contra válvula fechada: o motor aquece →
   alarme alto → desarme do inversor (crítico) → nível sobe → LSH (crítico).
   O badge de alarmes acende com a cor da pior severidade.
4. **Alarmes ISA-18.2** — o de temperatura aparece como *normalizado, não
   reconhecido*, com o **pico** atingido. Reconheça; reabra a válvula e
   envie o *Reset de falhas* (pulso na coil 3).
5. **Explorador** — leia `holding 0..9` (FC 03, ~50 ms), edite o registrador
   0 (FC 06) e veja o setpoint mudar na tela do equipamento.
6. **Resiliência** — desligue o ESP32: banner "Gateway inacessível", valores
   esmaecidos (qualidade *stale*), reconexão com backoff 1→2→5→10→15 s.

## Arquitetura

Clean Architecture em três camadas + MVVM com Cubit, no mesmo padrão de
[rickandmorty-fullstack](https://github.com/magnurv12/rickandmorty-fullstack)
e [tractian_challenge](https://github.com/magnurv12/tractian_challenge).

```
lib/
├── main.dart                     # Env.load → setupInjector → runApp
└── src/
    ├── app_widget.dart           # MaterialApp.router, tema, pt-BR
    ├── injector.dart             # get_it (singletons + factories de VM)
    ├── core/
    │   ├── env/                  # Env imutável lido do YAML
    │   ├── mvvm/                 # ViewModel (Cubit), ViewState, DM, efeitos
    │   └── network/              # ApiClient + exceções de transporte
    ├── domain/                   # Dart puro — sem Flutter, sem HTTP
    │   ├── entities/             # Plant, Equipment, TagDefinition, Alarm, ...
    │   ├── failures/             # Failure selada (freezed)
    │   ├── repositories/         # contratos
    │   ├── services/             # TagCodec (16/32 bits, float, word order),
    │   │                         # AlarmTracker (ISA-18.2 + histerese)
    │   └── usecases/             # I<Nome>UseCase + implementação
    ├── data/
    │   ├── datasources/          # Remote (http / web_socket_channel) e Simulated
    │   ├── live/                 # SubscriptionPlanner (agrupa tags em faixas)
    │   ├── mappers/              # FailureMapper: HTTP/WS/Modbus → Failure
    │   ├── models/               # freezed/json + parsers (API, WS, plant.yaml)
    │   ├── repositories/         # implementações
    │   └── simulator/            # PlantSimulator (física + lógica de CLP)
    └── presentation/
        ├── design_system/        # tokens (ThemeExtension), tema, componentes Ds*
        ├── router/               # go_router, rotas nomeadas
        ├── shared/               # formatters, presenters, widgets comuns
        └── views/<feature>/      # page + state (freezed selado) + viewmodel + widgets
```

### Decisões que valem destacar

- **Fluxo de erro unidirecional.** Datasources lançam exceções de
  transporte; repositórios convertem tudo em `Either<Failure, T>` num único
  `FailureMapper`; a apresentação só conhece `Failure`. Cada variante é uma
  *causa* que o operador entende (escravo não responde ≠ gateway
  inacessível ≠ fila cheia) e o presenter responde "o quê, por quê, o que
  fazer", com o contexto Modbus (FC, escravo, código 226...) como dica técnica.
- **Uma conexão WebSocket para o app inteiro.** O firmware aceita 4
  clientes; o `LiveDataRepository` é singleton, assina faixas agrupadas pelo
  `SubscriptionPlanner` (o mapa padrão cabe em 4 assinaturas), pausa em
  segundo plano e reconecta com backoff.
- **Qualidade de dado explícita** (`good` / `stale` / `bad`), como em SCADA
  de verdade: valor congelado nunca parece valor atual.
- **Escrita confirmada.** A UI marca a tag como pendente, bloqueia toque
  duplo e só atualiza o estado quando o valor volta pelo streaming.
- **Efeitos de uso único** (snackbar, haptics) saem por um stream separado
  (`ViewModelEffects`), não pelo estado — não se repetem em rebuilds.
- **Design system herdado pelo `context`.** Cores, espaçamento, raios,
  tipografia e movimento são `ThemeExtension`s; os componentes Material
  são configurados no tema; as telas usam `context.colors`,
  `context.spacing`, `context.ds`... Paleta ISA-101: cinza na operação
  normal, cor apenas para anormalidade; magenta para falha de comunicação;
  ícones com forma diferente por severidade (legível sem cor).
