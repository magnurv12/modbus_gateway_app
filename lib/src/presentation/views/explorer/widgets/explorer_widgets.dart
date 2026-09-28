import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../domain/domain.dart';
import '../../../design_system/design_system.dart';
import '../../../shared/shared.dart';
import '../explorer_state.dart';

/// Resultado da última leitura: cabeçalho técnico + tabela de endereços.
class ExplorerResult extends StatelessWidget {
  /// Estado.
  final ExplorerState state;

  /// Toque numa linha (escrita).
  final void Function(int address, int value) onRowTap;

  /// Cria um [ExplorerResult].
  const ExplorerResult({
    super.key,
    required this.state,
    required this.onRowTap,
  });

  @override
  Widget build(BuildContext context) {
    final block = state.block;
    final failure = state.failure;

    if (state.status == ExplorerStatus.failure && failure != null) {
      return DsCard(
        accentColor: failure.tone.color(context.colors).withValues(alpha: 0.6),
        child: _FailureInline(failure: failure, latency: state.latency),
      );
    }
    if (block == null) {
      return DsCard(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: context.spacing.xl),
          child: Column(
            children: [
              Icon(
                Icons.manage_search_rounded,
                size: 36,
                color: context.colors.textMuted,
              ),
              SizedBox(height: context.spacing.md),
              Text(
                state.isBusy
                    ? 'Lendo do barramento…'
                    : 'Escolha a faixa e toque em Ler.',
                style: context.text.bodyMedium,
              ),
            ],
          ),
        ),
      );
    }

    return DsCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(context.spacing.md),
            child: Wrap(
              spacing: context.spacing.sm,
              runSpacing: context.spacing.sm,
              children: [
                DsBadge(
                  label: 'FC ${block.functionCode.toString().padLeft(2, '0')}',
                  tone: DsTone.accent,
                ),
                DsBadge(label: 'escravo ${block.slave}'),
                DsBadge(label: '${block.count} endereços'),
                if (state.latency != null)
                  DsBadge(
                    label: '${state.latency!.inMilliseconds} ms',
                    icon: Icons.timer_outlined,
                  ),
                if (block.cached)
                  DsBadge(
                    label: 'cache ${block.ageMs ?? 0} ms',
                    icon: Icons.bolt_rounded,
                    tone: DsTone.low,
                  ),
                if (state.isBusy)
                  const DsBadge(
                    label: 'atualizando…',
                    icon: Icons.sync_rounded,
                  ),
              ],
            ),
          ),
          const Divider(),
          for (var i = 0; i < block.values.length; i++) ...[
            if (i > 0) Divider(indent: context.spacing.lg),
            _RegisterRow(
              table: block.table,
              address: block.startAddress + i,
              value: block.values[i],
              writing: state.writingAddress == block.startAddress + i,
              onTap: block.table.isWritable
                  ? () => onRowTap(block.startAddress + i, block.values[i])
                  : null,
            ),
          ],
        ],
      ),
    );
  }
}

class _RegisterRow extends StatelessWidget {
  final ModbusTable table;
  final int address;
  final int value;
  final bool writing;
  final VoidCallback? onTap;

  const _RegisterRow({
    required this.table,
    required this.address,
    required this.value,
    required this.writing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final c = context.colors;
    final mono = context.ds.mono;
    // Numeração legada dos manuais: 40001 = holding endereço 0.
    final legacy =
        '${table.legacyPrefix[0]}${(address + 1).toString().padLeft(4, '0')}';

    return InkWell(
      onTap: writing ? null : onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s.lg, vertical: s.md),
        child: Row(
          children: [
            SizedBox(
              width: 64,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$address',
                    style: mono.copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    legacy,
                    style: mono.copyWith(fontSize: 11, color: c.textMuted),
                  ),
                ],
              ),
            ),
            Expanded(
              child: table.isBit
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: DsBadge(
                        label: value != 0 ? 'ON' : 'OFF',
                        tone: value != 0 ? DsTone.accent : DsTone.neutral,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '$value',
                              style: mono.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: s.md),
                            Text(
                              Formatters.hex(value),
                              style: mono.copyWith(color: c.textSecondary),
                            ),
                            SizedBox(width: s.md),
                            Text(
                              '${value.toSigned(16)}',
                              style: mono.copyWith(
                                fontSize: 11,
                                color: c.textMuted,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          Formatters.binary(value),
                          style: mono.copyWith(
                            fontSize: 11,
                            color: c.textMuted,
                          ),
                        ),
                      ],
                    ),
            ),
            if (writing)
              const SizedBox.square(
                dimension: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else if (onTap != null)
              Icon(Icons.edit_outlined, size: 18, color: c.textMuted),
          ],
        ),
      ),
    );
  }
}

class _FailureInline extends StatelessWidget {
  final Failure failure;
  final Duration? latency;

  const _FailureInline({required this.failure, required this.latency});

  @override
  Widget build(BuildContext context) {
    final color = failure.tone.color(context.colors);
    final hint = failure.technicalHint;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(failure.icon, color: color),
        SizedBox(width: context.spacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(failure.title, style: context.text.titleSmall),
              SizedBox(height: context.spacing.xs),
              Text(failure.message, style: context.text.bodyMedium),
              if (hint != null || latency != null) ...[
                SizedBox(height: context.spacing.sm),
                Text(
                  [
                    ?hint,
                    if (latency != null) '${latency!.inMilliseconds} ms',
                  ].join(' · '),
                  style: context.ds.mono.copyWith(
                    fontSize: 11,
                    color: context.colors.textMuted,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

/// Log das últimas transações.
class ExplorerLog extends StatelessWidget {
  /// Entradas, mais recente primeiro.
  final List<ExplorerLogEntry> entries;

  /// Cria um [ExplorerLog].
  const ExplorerLog({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    final c = context.colors;
    final mono = context.ds.mono.copyWith(fontSize: 12);
    return DsCard(
      padding: EdgeInsets.symmetric(vertical: context.spacing.sm),
      child: Column(
        children: [
          for (final entry in entries)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.spacing.lg,
                vertical: context.spacing.xs,
              ),
              child: Row(
                children: [
                  Icon(
                    entry.ok ? Icons.check_rounded : Icons.close_rounded,
                    size: 16,
                    color: entry.ok ? c.success : c.alarmCritical,
                  ),
                  SizedBox(width: context.spacing.sm),
                  Text(
                    Formatters.time(entry.at),
                    style: mono.copyWith(color: c.textMuted),
                  ),
                  SizedBox(width: context.spacing.sm),
                  Expanded(
                    child: Text(
                      entry.detail == null
                          ? entry.operation
                          : '${entry.operation} · ${entry.detail}',
                      style: mono,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${entry.latency.inMilliseconds} ms',
                    style: mono.copyWith(color: c.textSecondary),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Diálogo de escrita de registrador (decimal ou hex `0x..`).
Future<int?> showRegisterWriteDialog(
  BuildContext context, {
  required int address,
  required int current,
}) {
  return showDialog<int>(
    context: context,
    builder: (context) =>
        _RegisterWriteDialog(address: address, current: current),
  );
}

class _RegisterWriteDialog extends StatefulWidget {
  final int address;
  final int current;

  const _RegisterWriteDialog({required this.address, required this.current});

  @override
  State<_RegisterWriteDialog> createState() => _RegisterWriteDialogState();
}

class _RegisterWriteDialogState extends State<_RegisterWriteDialog> {
  late final _controller = TextEditingController(text: '${widget.current}');
  int? _parsed;

  @override
  void initState() {
    super.initState();
    _parsed = widget.current;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int? _parse(String text) {
    final t = text.trim().toLowerCase();
    final value = t.startsWith('0x')
        ? int.tryParse(t.substring(2), radix: 16)
        : int.tryParse(t);
    if (value == null || value < 0 || value > ModbusTable.maxRegisterValue) {
      return null;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Holding ${widget.address}'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Escreve via FC 06 e aguarda a confirmação do escravo.'),
          SizedBox(height: context.spacing.lg),
          TextField(
            controller: _controller,
            autofocus: true,
            style: context.ds.mono.copyWith(fontSize: 18),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('[0-9a-fA-FxX]')),
            ],
            decoration: InputDecoration(
              labelText: 'Valor (0–65535 ou 0x0000–0xFFFF)',
              errorText: _parsed == null ? 'Valor inválido' : null,
              helperText: _parsed == null
                  ? null
                  : '${Formatters.hex(_parsed!)} · ${Formatters.binary(_parsed!)}',
            ),
            onChanged: (text) => setState(() => _parsed = _parse(text)),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: _parsed == null
              ? null
              : () => Navigator.of(context).pop(_parsed),
          child: const Text('Escrever'),
        ),
      ],
    );
  }
}
