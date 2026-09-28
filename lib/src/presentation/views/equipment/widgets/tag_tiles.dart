import 'package:flutter/material.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';

/// Linha de medição analógica: valor + gauge com limites de alarme.
class MeasurementTile extends StatelessWidget {
  /// Tag.
  final TagDefinition tag;

  /// Leitura.
  final TagReading? reading;

  /// Severidade ativa, se em alarme.
  final AlarmSeverity? alarm;

  /// Cria um [MeasurementTile].
  const MeasurementTile({
    super.key,
    required this.tag,
    required this.reading,
    this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final value = reading?.value;
    final min = tag.min;
    final max = tag.max;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: s.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Text(tag.name, style: context.text.bodyMedium)),
              TagValueText(tag: tag, reading: reading, alarm: alarm),
            ],
          ),
          if (min != null && max != null) ...[
            SizedBox(height: s.sm),
            DsLinearGauge(
              value: value is NumberTagValue ? value.value : null,
              min: min,
              max: max,
              color: alarm?.tone.color(c),
              markers: [
                for (final rule in tag.alarms)
                  if (rule.limit != null)
                    DsGaugeMarker(rule.limit!, rule.severity.tone.color(c)),
              ],
            ),
            SizedBox(height: s.xs),
            Row(
              children: [
                Text(
                  Formatters.number(min, decimals: tag.decimals),
                  style: context.text.bodySmall,
                ),
                const Spacer(),
                Text(
                  Formatters.withUnit(max, tag.unit, decimals: tag.decimals),
                  style: context.text.bodySmall,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Bloco de status digital.
class StatusTile extends StatelessWidget {
  /// Tag.
  final TagDefinition tag;

  /// Leitura.
  final TagReading? reading;

  /// Severidade ativa, se em alarme.
  final AlarmSeverity? alarm;

  /// Cria um [StatusTile].
  const StatusTile({
    super.key,
    required this.tag,
    required this.reading,
    this.alarm,
  });

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final s = context.spacing;
    final on = switch (reading?.value) {
      BooleanTagValue(:final value) => value,
      _ => null,
    };
    final alarmColor = alarm?.tone.color(c);

    return AnimatedContainer(
      duration: context.motion.normal,
      padding: EdgeInsets.all(s.md),
      decoration: BoxDecoration(
        color: alarmColor?.withValues(alpha: 0.12) ?? c.surfaceSunken,
        borderRadius: context.radius.md,
        border: Border.all(color: alarmColor ?? c.border),
      ),
      child: Row(
        children: [
          Icon(
            alarm?.icon ??
                (on == true
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_unchecked_rounded),
            size: 18,
            color: alarmColor ?? (on == true ? c.running : c.stopped),
          ),
          SizedBox(width: s.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tag.name,
                  style: context.text.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: s.xxs),
                TagValueText(tag: tag, reading: reading, alarm: alarm),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Comando digital: switch com confirmação, ou botão de pulso.
class CommandTile extends StatelessWidget {
  /// Tag.
  final TagDefinition tag;

  /// Leitura (estado atual da coil).
  final TagReading? reading;

  /// Escrita em andamento.
  final bool pending;

  /// Novo estado pedido (já confirmado pelo operador).
  final ValueChanged<bool> onChanged;

  /// Pulso (coils momentâneas).
  final VoidCallback onPulse;

  /// Cria um [CommandTile].
  const CommandTile({
    super.key,
    required this.tag,
    required this.reading,
    required this.pending,
    required this.onChanged,
    required this.onPulse,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final on = switch (reading?.value) {
      BooleanTagValue(:final value) => value,
      _ => null,
    };
    final canCommand = !pending && reading?.quality == TagQuality.good;

    final Widget control;
    if (pending) {
      control = const SizedBox.square(
        dimension: 24,
        child: CircularProgressIndicator(strokeWidth: 2.5),
      );
    } else if (tag.momentary) {
      control = OutlinedButton.icon(
        onPressed: canCommand ? () => _confirmPulse(context) : null,
        icon: const Icon(Icons.touch_app_rounded, size: 18),
        label: const Text('Enviar'),
      );
    } else {
      control = Switch(
        value: on ?? false,
        onChanged: canCommand && on != null
            ? (value) => _confirmToggle(context, value)
            : null,
      );
    }

    final row = Padding(
      padding: EdgeInsets.symmetric(vertical: s.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag.name, style: context.text.titleSmall),
                SizedBox(height: s.xxs),
                Text(
                  tag.momentary
                      ? 'Pulso de 0,5 s na coil ${tag.address}'
                      : on == null
                      ? 'Aguardando leitura…'
                      : 'Estado: ${on ? tag.onLabel : tag.offLabel} · coil ${tag.address}',
                  style: context.text.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(width: s.md),
          control,
        ],
      ),
    );
    // Um nó só para o leitor de tela: "Comando da bomba, Estado: Ligada,
    // ativado" em vez de um switch sem rótulo.
    return MergeSemantics(child: row);
  }

  Future<void> _confirmToggle(BuildContext context, bool value) async {
    final label = value ? tag.onLabel : tag.offLabel;
    final ok = await showDsConfirmDialog(
      context,
      title: '${tag.name}: $label?',
      message:
          'O comando será enviado ao escravo Modbus e só será '
          'considerado concluído após a confirmação dele.',
      confirmLabel: 'Confirmar',
      tone: value ? DsTone.accent : DsTone.high,
      icon: value ? Icons.power_settings_new_rounded : Icons.power_off_rounded,
    );
    if (ok) onChanged(value);
  }

  Future<void> _confirmPulse(BuildContext context) async {
    final ok = await showDsConfirmDialog(
      context,
      title: '${tag.name}?',
      message: 'Envia um pulso (liga e desliga) na coil ${tag.address}.',
      confirmLabel: 'Enviar',
      icon: Icons.restart_alt_rounded,
    );
    if (ok) onPulse();
  }
}

/// Parâmetro/setpoint com botão de ajuste.
class SetpointTile extends StatelessWidget {
  /// Tag.
  final TagDefinition tag;

  /// Leitura.
  final TagReading? reading;

  /// Escrita em andamento.
  final bool pending;

  /// Abrir ajuste.
  final VoidCallback onEdit;

  /// Cria um [SetpointTile].
  const SetpointTile({
    super.key,
    required this.tag,
    required this.reading,
    required this.pending,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final range = tag.min != null && tag.max != null
        ? 'faixa ${Formatters.number(tag.min!, decimals: tag.decimals)}–'
              '${Formatters.withUnit(tag.max!, tag.unit, decimals: tag.decimals)}'
        : 'sem faixa definida';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: s.sm),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag.name, style: context.text.titleSmall),
                SizedBox(height: s.xxs),
                Text(
                  '$range · holding ${tag.address}',
                  style: context.text.bodySmall,
                ),
              ],
            ),
          ),
          TagValueText(tag: tag, reading: reading),
          SizedBox(width: s.sm),
          pending
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox.square(
                    dimension: 22,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  ),
                )
              : IconButton.filledTonal(
                  tooltip: 'Ajustar',
                  onPressed: reading?.quality == TagQuality.good
                      ? onEdit
                      : null,
                  icon: const Icon(Icons.tune_rounded),
                ),
        ],
      ),
    );
  }
}
