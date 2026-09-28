import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';

/// Abre o ajuste de setpoint e devolve o valor escolhido (ou `null`).
Future<double?> showSetpointSheet(
  BuildContext context, {
  required TagDefinition tag,
  required double current,
}) {
  return showModalBottomSheet<double>(
    context: context,
    isScrollControlled: true,
    builder: (context) => SetpointSheet(tag: tag, current: current),
  );
}

/// Bottom sheet de ajuste de setpoint: slider + campo numérico sincronizados.
class SetpointSheet extends StatefulWidget {
  /// Tag.
  final TagDefinition tag;

  /// Valor atual.
  final double current;

  /// Cria um [SetpointSheet].
  const SetpointSheet({super.key, required this.tag, required this.current});

  @override
  State<SetpointSheet> createState() => _SetpointSheetState();
}

class _SetpointSheetState extends State<SetpointSheet> {
  late double _value = _clamp(widget.current);
  late final TextEditingController _controller = TextEditingController(
    text: _format(_value),
  );
  String? _error;

  TagDefinition get _tag => widget.tag;
  double get _min => _tag.min ?? 0;
  double get _max => _tag.max ?? math.max(widget.current * 2, 100);
  double get _step => math.pow(10, -_tag.decimals).toDouble();

  double _clamp(double v) => v.clamp(_min, _max).toDouble();

  String _format(double v) => Formatters.number(
    v,
    decimals: _tag.decimals,
  ).replaceAll('.', ''); // campo sem separador de milhar

  void _onSlider(double v) {
    final snapped = (v / _step).round() * _step;
    setState(() {
      _value = _clamp(snapped);
      _error = null;
      _controller.text = _format(_value);
    });
  }

  void _onText(String text) {
    final parsed = double.tryParse(text.replaceAll(',', '.'));
    setState(() {
      if (parsed == null) {
        _error = 'Número inválido';
      } else if (parsed < _min || parsed > _max) {
        _error = 'Fora da faixa ${_format(_min)}–${_format(_max)}';
      } else {
        _error = null;
        _value = parsed;
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final divisions = ((_max - _min) / _step).round();
    final changed = (_value - widget.current).abs() >= _step / 2;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        s.xl,
        0,
        s.xl,
        s.xl + MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(_tag.name, style: context.text.titleLarge),
          SizedBox(height: s.xs),
          Text(
            'Atual: ${Formatters.withUnit(widget.current, _tag.unit, decimals: _tag.decimals)}',
            style: context.text.bodyMedium,
          ),
          SizedBox(height: s.xl),
          Center(
            child: DsValueText(
              value: Formatters.number(_value, decimals: _tag.decimals),
              unit: _tag.unit,
              size: DsValueSize.hero,
              color: changed ? context.colors.accent : null,
            ),
          ),
          Slider(
            value: _value,
            min: _min,
            max: _max,
            divisions: divisions > 0 && divisions <= 2000 ? divisions : null,
            onChanged: _onSlider,
          ),
          Row(
            children: [
              Text(_format(_min), style: context.text.bodySmall),
              const Spacer(),
              Text(_format(_max), style: context.text.bodySmall),
            ],
          ),
          SizedBox(height: s.lg),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.numberWithOptions(
              decimal: _tag.decimals > 0,
              signed: _min < 0,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[-0-9,\.]')),
            ],
            decoration: InputDecoration(
              labelText: 'Valor',
              suffixText: _tag.unit,
              errorText: _error,
            ),
            onChanged: _onText,
          ),
          SizedBox(height: s.xl),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar'),
                ),
              ),
              SizedBox(width: s.md),
              Expanded(
                child: FilledButton.icon(
                  onPressed: _error == null && changed
                      ? () => Navigator.of(context).pop(_value)
                      : null,
                  icon: const Icon(Icons.send_rounded, size: 18),
                  label: const Text('Enviar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
