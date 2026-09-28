import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../design_system/design_system.dart';
import '../../shared/shared.dart';
import 'gateway_state.dart';
import 'gateway_viewmodel.dart';

/// Saúde do gateway: enlace Modbus, streaming, Wi-Fi e firmware.
class GatewayPage extends StatefulWidget {
  /// Cria um [GatewayPage].
  const GatewayPage({super.key});

  @override
  State<GatewayPage> createState() => _GatewayPageState();
}

class _GatewayPageState extends ViewState<GatewayPage, GatewayViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gateway')),
      body: ViewModelBuilder<GatewayViewModel, GatewayState>(
        viewModel: viewModel,
        builder: (context, state) => switch (state) {
          GatewayStateLoading() => const DsLoadingView(cards: 4),
          GatewayStateError(:final failure) => FailureView(
            failure: failure,
            onRetry: viewModel.load,
          ),
          final GatewayStateLoaded loaded => RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: _Loaded(state: loaded, viewModel: viewModel),
          ),
        },
      ),
    );
  }
}

class _Loaded extends StatelessWidget {
  final GatewayStateLoaded state;
  final GatewayViewModel viewModel;

  const _Loaded({required this.state, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final c = context.colors;
    final h = state.health;
    final rate = h.successRate;

    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.fromLTRB(s.page, s.sm, s.page, s.xxxl),
      children: [
        _LinkHero(state: state, viewModel: viewModel),
        if (state.refreshFailure != null) ...[
          SizedBox(height: s.md),
          DsCard(
            accentColor: c.badQuality.withValues(alpha: 0.6),
            child: Row(
              children: [
                Icon(state.refreshFailure!.icon, color: c.badQuality),
                SizedBox(width: s.md),
                Expanded(
                  child: Text(
                    '${state.refreshFailure!.title}. Exibindo dados de '
                    '${Formatters.time(state.updatedAt)}.',
                    style: context.text.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ],
        const DsSectionHeader('Barramento RS-485'),
        _InfoCard(
          rows: [
            _Row(
              'Configuração',
              '${h.modbus.baud} bps · ${h.modbus.format} · timeout ${h.modbus.responseTimeoutMs} ms',
            ),
            _Row(
              'Transações OK',
              Formatters.number(h.modbus.okCount.toDouble()),
            ),
            _Row(
              'Transações com erro',
              Formatters.number(h.modbus.errorCount.toDouble()),
              color: h.modbus.errorCount > 0 ? c.alarmMedium : null,
            ),
            _Row(
              'Último resultado',
              h.modbus.lastResult,
              color: h.modbus.lastResult == 'Success' ? null : c.alarmHigh,
            ),
            if (h.modbus.lastSlave != null)
              _Row('Último escravo', '${h.modbus.lastSlave}'),
            _Row(
              'Respostas do cache',
              Formatters.number(h.modbus.cacheHits.toDouble()),
            ),
          ],
          footer: rate == null
              ? null
              : _Meter(
                  label: 'Taxa de sucesso',
                  value: '${Formatters.number(rate * 100, decimals: 1)} %',
                  fraction: rate,
                  color: rate < 0.95 ? c.alarmMedium : c.success,
                ),
        ),
        const DsSectionHeader('Streaming WebSocket'),
        _InfoCard(
          rows: [
            _Row('Clientes conectados', '${h.stream.clients} / 4'),
            _Row('Assinaturas', '${h.stream.subscriptions} / 32'),
            _Row('Faixas consultadas', '${h.stream.pollBlocks} / 16'),
          ],
          footer: _Meter(
            label: 'Carga do barramento (limite 70 %)',
            value: '${Formatters.number(h.stream.busLoadPct, decimals: 1)} %',
            fraction: h.stream.busLoadPct / 70,
            color: h.stream.busLoadPct > 60 ? c.alarmMedium : null,
          ),
        ),
        const DsSectionHeader('Wi-Fi'),
        _InfoCard(
          rows: [
            _Row(
              'Rede',
              h.wifi.ssid,
              trailing: DsSignalBars(bars: h.wifi.signalBars),
            ),
            _Row('Sinal', '${h.wifi.rssi} dBm · canal ${h.wifi.channel}'),
            _Row('IP', h.wifi.ip, copyable: true),
            _Row('Hostname', '${h.wifi.hostname}.local', copyable: true),
            _Row('MAC', h.wifi.mac),
          ],
        ),
        const DsSectionHeader('Sistema'),
        _InfoCard(
          rows: [
            _Row('Firmware', h.firmware.version),
            _Row('Chip', h.firmware.chip),
            _Row(
              'ESP-IDF · Arduino',
              '${h.firmware.idf} · ${h.firmware.arduinoCore}',
            ),
            _Row('Compilado em', h.firmware.buildTime),
            _Row('Heap livre', Formatters.bytes(h.freeHeapBytes)),
            _Row(
              'Último reset',
              _resetReason(h.resetReason),
              color: _isAbnormalReset(h.resetReason) ? c.alarmHigh : null,
            ),
          ],
        ),
        const DsSectionHeader('Conexão do app'),
        _InfoCard(
          rows: [
            _Row('Ambiente', viewModel.environment),
            _Row('Endereço', viewModel.endpoint, copyable: true),
            _Row('Documentação', viewModel.docsUrl, copyable: true),
            if (viewModel.simulated)
              _Row('Fonte de dados', 'Simulador embutido', color: c.alarmLow),
          ],
        ),
      ],
    );
  }

  static String _resetReason(String reason) => switch (reason) {
    'power_on' => 'Energização',
    'external_pin' => 'Pino de reset',
    'software' => 'Software',
    'panic' => 'Pânico (crash)',
    'interrupt_watchdog' ||
    'task_watchdog' ||
    'other_watchdog' => 'Watchdog ($reason)',
    'brownout' => 'Queda de tensão',
    'deep_sleep' => 'Deep sleep',
    _ => reason,
  };

  static bool _isAbnormalReset(String reason) =>
      reason == 'panic' || reason == 'brownout' || reason.contains('watchdog');
}

class _LinkHero extends StatelessWidget {
  final GatewayStateLoaded state;
  final GatewayViewModel viewModel;

  const _LinkHero({required this.state, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final up = state.health.modbusLinkUp;
    final color = up ? c.success : c.alarmCritical;

    return DsCard(
      accentColor: up ? null : color,
      padding: EdgeInsets.all(s.xl),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(s.md),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.14),
            ),
            child: Icon(
              up ? Icons.cable_rounded : Icons.link_off_rounded,
              color: color,
              size: 30,
            ),
          ),
          SizedBox(width: s.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  up ? 'Enlace Modbus ativo' : 'Escravo não responde',
                  style: context.text.titleMedium,
                ),
                SizedBox(height: s.xxs),
                Text(
                  'No ar há ${Formatters.duration(state.health.uptime)} · '
                  'atualizado ${Formatters.time(state.updatedAt)}',
                  style: context.text.bodySmall,
                ),
              ],
            ),
          ),
          if (state.refreshing)
            const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
        ],
      ),
    );
  }
}

class _Row {
  final String label;
  final String value;
  final Color? color;
  final bool copyable;
  final Widget? trailing;

  const _Row(
    this.label,
    this.value, {
    this.color,
    this.copyable = false,
    this.trailing,
  });
}

class _InfoCard extends StatelessWidget {
  final List<_Row> rows;
  final Widget? footer;

  const _InfoCard({required this.rows, this.footer});

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    return DsCard(
      padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.sm),
      child: Column(
        children: [
          for (final (i, row) in rows.indexed) ...[
            if (i > 0) const Divider(),
            InkWell(
              onLongPress: row.copyable
                  ? () {
                      Clipboard.setData(ClipboardData(text: row.value));
                      context.showDsSnackBar(
                        'Copiado: ${row.value}',
                        icon: Icons.copy_rounded,
                      );
                    }
                  : null,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: s.md),
                child: Row(
                  children: [
                    Text(row.label, style: context.text.bodyMedium),
                    SizedBox(width: s.lg),
                    Expanded(
                      child: Text(
                        row.value,
                        textAlign: TextAlign.end,
                        style: context.ds.mono.copyWith(
                          color: row.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (row.trailing != null) ...[
                      SizedBox(width: s.sm),
                      row.trailing!,
                    ],
                    if (row.copyable) ...[
                      SizedBox(width: s.sm),
                      Icon(
                        Icons.copy_rounded,
                        size: 14,
                        color: context.colors.textMuted,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
          if (footer != null) ...[
            const Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: s.md),
              child: footer,
            ),
          ],
        ],
      ),
    );
  }
}

class _Meter extends StatelessWidget {
  final String label;
  final String value;
  final double fraction;
  final Color? color;

  const _Meter({
    required this.label,
    required this.value,
    required this.fraction,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: context.text.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(width: context.spacing.sm),
            Text(
              value,
              style: context.ds.mono.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(height: context.spacing.sm),
        DsMeterBar(fraction: fraction, color: color),
      ],
    );
  }
}
