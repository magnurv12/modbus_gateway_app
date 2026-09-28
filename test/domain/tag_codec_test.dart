import 'package:flutter_test/flutter_test.dart';
import 'package:modbus_supervisor/src/domain/domain.dart';

void main() {
  const codec = TagCodec();

  TagDefinition tag({
    ModbusTable table = ModbusTable.holding,
    TagDataType type = TagDataType.uint16,
    WordOrder order = WordOrder.big,
    double scale = 1,
    double offset = 0,
    double? min,
    double? max,
  }) =>
      TagDefinition(
        id: 't',
        name: 'T',
        table: table,
        address: 10,
        dataType: table.isBit ? TagDataType.boolean : type,
        wordOrder: order,
        scale: scale,
        offset: offset,
        min: min,
        max: max,
      );

  int? Function(int) raw(Map<int, int> values) => (a) => values[a];

  group('decode', () {
    test('uint16 com escala', () {
      final v = codec.decode(tag(scale: 0.1), raw({10: 724}));
      expect(v, const TagValue.number(72.4));
    });

    test('int16 negativo (complemento de dois)', () {
      final v = codec.decode(tag(type: TagDataType.int16), raw({10: 0xFFF6}));
      expect(v, const TagValue.number(-10));
    });

    test('uint32 big-endian acima de 65535', () {
      // 1234567 = 0x0012D687
      final v = codec.decode(
        tag(type: TagDataType.uint32),
        raw({10: 0x0012, 11: 0xD687}),
      );
      expect(v, const TagValue.number(1234567));
    });

    test('uint32 little-endian (word swap)', () {
      final v = codec.decode(
        tag(type: TagDataType.uint32, order: WordOrder.little),
        raw({10: 0xD687, 11: 0x0012}),
      );
      expect(v, const TagValue.number(1234567));
    });

    test('float32 IEEE-754', () {
      // 3.5 = 0x40600000
      final v = codec.decode(
        tag(type: TagDataType.float32),
        raw({10: 0x4060, 11: 0x0000}),
      );
      expect(v, const TagValue.number(3.5));
    });

    test('32 bits sem a segunda palavra retorna null', () {
      expect(codec.decode(tag(type: TagDataType.uint32), raw({10: 1})), isNull);
    });

    test('bit', () {
      final v = codec.decode(tag(table: ModbusTable.coils), raw({10: 1}));
      expect(v, const TagValue.boolean(true));
    });
  });

  group('encode', () {
    test('aplica escala e offset inversos', () {
      final r = codec.encode(
        tag(scale: 0.1, offset: 0, min: 0, max: 60),
        const TagValue.number(45.5),
      );
      expect(r.right, [455]);
    });

    test('rejeita valor fora da faixa de engenharia', () {
      final r = codec.encode(
        tag(scale: 0.1, min: 0, max: 60),
        const TagValue.number(61),
      );
      expect(r.left, isA<ValidationFailure>());
    });

    test('rejeita escrita em input register', () {
      final r = codec.encode(
        tag(table: ModbusTable.input),
        const TagValue.number(1),
      );
      expect(r.left, isA<ReadOnlyFailure>());
    });

    test('int16 negativo vira complemento de dois', () {
      final r = codec.encode(
        tag(type: TagDataType.int16),
        const TagValue.number(-10),
      );
      expect(r.right, [0xFFF6]);
    });

    test('ida e volta em uint32/float32 para as duas ordens de palavra', () {
      for (final order in WordOrder.values) {
        for (final (type, value) in [
          (TagDataType.uint32, 3000000000.0),
          (TagDataType.int32, -123456.0),
          (TagDataType.float32, -12.25),
        ]) {
          final t = tag(type: type, order: order);
          final regs = codec.encode(t, TagValue.number(value)).right;
          final back = codec.decode(t, raw({10: regs[0], 11: regs[1]}));
          expect(back, TagValue.number(value), reason: '$type $order');
        }
      }
    });

    test('coil aceita apenas booleano', () {
      final t = tag(table: ModbusTable.coils);
      expect(codec.encode(t, const TagValue.boolean(true)).right, [1]);
      expect(
        codec.encode(t, const TagValue.number(1)).left,
        isA<ValidationFailure>(),
      );
    });
  });
}
