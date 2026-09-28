import '../../domain/domain.dart';

/// Faixa de endereços assinada e as tags que dependem dela.
class SubscriptionPlan {
  /// Id da assinatura no protocolo.
  final String id;

  /// Tabela.
  final ModbusTable table;

  /// Escravo (`null` = padrão do gateway).
  final int? slave;

  /// Primeiro endereço.
  final int start;

  /// Quantidade de endereços.
  final int count;

  /// Tags decodificadas a partir desta faixa.
  final List<TagDefinition> tags;

  /// Cria um [SubscriptionPlan].
  const SubscriptionPlan({
    required this.id,
    required this.table,
    required this.slave,
    required this.start,
    required this.count,
    required this.tags,
  });
}

/// Agrupa as tags da planta no menor número de assinaturas.
///
/// O firmware aceita 8 assinaturas por conexão e 16 faixas distintas no
/// total, e cada faixa custa uma transação no barramento. Agrupar tags
/// vizinhas (mesmo escravo e tabela) numa faixa só reduz a carga.
abstract final class SubscriptionPlanner {
  /// Maior buraco entre tags que ainda compensa ler junto (ler 8 endereços
  /// a mais custa menos que uma transação extra).
  static const int maxGap = 8;

  /// Limite de assinaturas por conexão imposto pelo firmware.
  static const int maxSubscriptions = 8;

  /// Gera o plano. Lança [StateError] se passar do limite do firmware.
  static List<SubscriptionPlan> plan(Iterable<TagDefinition> tags) {
    final groups = <(int?, ModbusTable), List<TagDefinition>>{};
    for (final tag in tags) {
      groups.putIfAbsent((tag.slave, tag.table), () => []).add(tag);
    }

    final plans = <SubscriptionPlan>[];
    for (final MapEntry(key: (slave, table), value: group) in groups.entries) {
      group.sort((a, b) => a.address.compareTo(b.address));

      var current = <TagDefinition>[group.first];
      var start = group.first.address;
      var end = group.first.lastAddress;

      void flush() {
        plans.add(SubscriptionPlan(
          id: '${table.path}-${slave ?? 'd'}-$start',
          table: table,
          slave: slave,
          start: start,
          count: end - start + 1,
          tags: List.unmodifiable(current),
        ));
      }

      for (final tag in group.skip(1)) {
        final newEnd = tag.lastAddress > end ? tag.lastAddress : end;
        final fits = tag.address - end - 1 <= maxGap &&
            newEnd - start + 1 <= table.maxReadCount;
        if (fits) {
          current.add(tag);
          end = newEnd;
        } else {
          flush();
          current = [tag];
          start = tag.address;
          end = tag.lastAddress;
        }
      }
      flush();
    }

    if (plans.length > maxSubscriptions) {
      throw StateError(
        'O mapa precisa de ${plans.length} faixas; o gateway aceita '
        '$maxSubscriptions por conexão. Aproxime os endereços das tags.',
      );
    }
    return plans;
  }
}
