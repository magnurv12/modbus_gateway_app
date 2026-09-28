import 'package:intl/intl.dart';

import '../../domain/domain.dart';

/// Formatação de valores para exibição (pt-BR).
abstract final class Formatters {
  static const _locale = 'pt_BR';
  static final Map<int, NumberFormat> _numberCache = {};

  /// Número com [decimals] casas e separador de milhar (ex.: `12.345,6`).
  static String number(double value, {int decimals = 0}) {
    final format = _numberCache.putIfAbsent(
      decimals,
      () => NumberFormat.decimalPatternDigits(
        locale: _locale,
        decimalDigits: decimals,
      ),
    );
    return format.format(value);
  }

  /// Valor de uma tag (sem unidade). Digitais usam os rótulos da tag.
  static String tagValue(TagDefinition tag, TagValue? value) {
    return switch (value) {
      null => '—',
      NumberTagValue(:final value) => number(value, decimals: tag.decimals),
      BooleanTagValue(:final value) => value ? tag.onLabel : tag.offLabel,
    };
  }

  /// Valor com unidade (ex.: `72,4 %`).
  static String withUnit(double value, String unit, {int decimals = 0}) {
    final text = number(value, decimals: decimals);
    return unit.isEmpty ? text : '$text $unit';
  }

  /// Duração compacta (`3 d 04 h`, `12 min 05 s`).
  static String duration(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    if (d.inDays > 0) return '${d.inDays} d ${two(d.inHours % 24)} h';
    if (d.inHours > 0) return '${d.inHours} h ${two(d.inMinutes % 60)} min';
    if (d.inMinutes > 0) return '${d.inMinutes} min ${two(d.inSeconds % 60)} s';
    return '${d.inSeconds} s';
  }

  /// Hora `HH:mm:ss`.
  static String time(DateTime t) => DateFormat.Hms(_locale).format(t);

  /// Tempo relativo curto (`agora`, `há 12 s`, `há 3 min`).
  static String ago(DateTime t, {DateTime? now}) {
    final diff = (now ?? DateTime.now()).difference(t);
    if (diff.inSeconds < 2) return 'agora';
    if (diff.inMinutes < 1) return 'há ${diff.inSeconds} s';
    if (diff.inHours < 1) return 'há ${diff.inMinutes} min';
    return 'há ${diff.inHours} h';
  }

  /// Bytes legíveis (`176,4 kB`).
  static String bytes(int bytes) {
    if (bytes < 1024) return '$bytes B';
    return '${number(bytes / 1024, decimals: 1)} kB';
  }

  /// Hexadecimal de 16 bits (`0x01F4`).
  static String hex(int value) =>
      '0x${value.toRadixString(16).toUpperCase().padLeft(4, '0')}';

  /// Binário de 16 bits agrupado em nibbles (`0000 0001 1111 0100`).
  static String binary(int value) {
    final bits = value.toRadixString(2).padLeft(16, '0');
    return [for (var i = 0; i < 16; i += 4) bits.substring(i, i + 4)].join(' ');
  }
}
