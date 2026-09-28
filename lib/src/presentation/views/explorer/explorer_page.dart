import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../design_system/design_system.dart';
import '../../shared/shared.dart';
import 'explorer_state.dart';
import 'explorer_viewmodel.dart';
import 'widgets/explorer_widgets.dart';

/// Explorador Modbus: leitura/escrita crua em qualquer tabela.
class ExplorerPage extends StatefulWidget {
  /// Cria um [ExplorerPage].
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends ViewState<ExplorerPage, ExplorerViewModel> {
  late final _slave = TextEditingController(text: '${viewModel.state.slave}');
  late final _start = TextEditingController(text: '${viewModel.state.start}');
  late final _count = TextEditingController(text: '${viewModel.state.count}');

  @override
  void dispose() {
    _slave.dispose();
    _start.dispose();
    _count.dispose();
    super.dispose();
  }

  void _syncQuery() {
    viewModel.updateQuery(
      slave: int.tryParse(_slave.text) ?? -1,
      start: int.tryParse(_start.text) ?? -1,
      count: int.tryParse(_count.text) ?? -1,
    );
  }

  void _onEffect(BuildContext context, ExplorerEffect effect) {
    switch (effect) {
      case ExplorerWriteConfirmed(:final message):
        context.showDsSnackBar(
          message,
          tone: DsTone.success,
          icon: Icons.check_circle_rounded,
        );
      case ExplorerWriteFailed(:final failure):
        context.showFailure(failure);
    }
  }

  Future<void> _onRowTap(ExplorerState state, int address, int value) async {
    if (!state.table.isWritable || state.writingAddress != null) return;
    if (state.table.isBit) {
      final next = value == 0;
      final ok = await showDsConfirmDialog(
        context,
        title: 'Coil $address → ${next ? 'ON' : 'OFF'}?',
        message: 'Escreve via FC 05 no escravo ${state.slave}.',
        confirmLabel: 'Escrever',
        icon: Icons.edit_rounded,
      );
      if (ok) await viewModel.write(address, next ? 1 : 0);
      return;
    }
    final newValue = await showRegisterWriteDialog(
      context,
      address: address,
      current: value,
    );
    if (newValue != null) await viewModel.write(address, newValue);
  }

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    return ViewModelEffectListener<ExplorerEffect>(
      effects: viewModel.effects,
      onEffect: _onEffect,
      child: Scaffold(
        appBar: AppBar(title: const Text('Explorador Modbus')),
        body: ViewModelBuilder<ExplorerViewModel, ExplorerState>(
          viewModel: viewModel,
          builder: (context, state) => ListView(
            padding: EdgeInsets.fromLTRB(s.page, s.sm, s.page, s.xxxl),
            children: [
              _QueryCard(
                state: state,
                slave: _slave,
                start: _start,
                count: _count,
                onChanged: _syncQuery,
                onTable: (table) {
                  viewModel.setTable(table);
                  _count.text = '${viewModel.state.count}';
                },
                onRead: () {
                  FocusScope.of(context).unfocus();
                  _syncQuery();
                  viewModel.read();
                },
                onToggleAuto: () {
                  _syncQuery();
                  viewModel.toggleAutoRefresh();
                },
              ),
              const DsSectionHeader('Resultado'),
              ExplorerResult(
                state: state,
                onRowTap: (address, value) => _onRowTap(state, address, value),
              ),
              if (state.log.isNotEmpty) ...[
                DsSectionHeader('Transações', caption: '${state.log.length}'),
                ExplorerLog(entries: state.log),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _QueryCard extends StatelessWidget {
  final ExplorerState state;
  final TextEditingController slave;
  final TextEditingController start;
  final TextEditingController count;
  final VoidCallback onChanged;
  final ValueChanged<ModbusTable> onTable;
  final VoidCallback onRead;
  final VoidCallback onToggleAuto;

  const _QueryCard({
    required this.state,
    required this.slave,
    required this.start,
    required this.count,
    required this.onChanged,
    required this.onTable,
    required this.onRead,
    required this.onToggleAuto,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.spacing;
    final digits = [FilteringTextInputFormatter.digitsOnly];

    Widget field(String label, TextEditingController c, {String? helper}) =>
        Expanded(
          child: TextField(
            controller: c,
            keyboardType: TextInputType.number,
            inputFormatters: digits,
            onChanged: (_) => onChanged(),
            style: context.ds.mono.copyWith(fontSize: 16),
            decoration: InputDecoration(labelText: label, helperText: helper),
          ),
        );

    return DsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SegmentedButton<ModbusTable>(
            showSelectedIcon: false,
            segments: [
              for (final table in ModbusTable.values)
                ButtonSegment(value: table, label: Text(table.shortLabel)),
            ],
            selected: {state.table},
            onSelectionChanged: (set) => onTable(set.single),
          ),
          SizedBox(height: s.sm),
          Text(
            '${state.table.label} (${state.table.legacyPrefix[0]}xxxx) · '
            '${state.table.description}',
            style: context.text.bodySmall,
          ),
          SizedBox(height: s.lg),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              field('Escravo', slave, helper: '1–247'),
              SizedBox(width: s.sm),
              field('Início', start, helper: 'base 0'),
              SizedBox(width: s.sm),
              field('Qtd.', count, helper: 'máx. ${state.table.maxReadCount}'),
            ],
          ),
          SizedBox(height: s.lg),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: state.isBusy ? null : onRead,
                  icon: state.isBusy
                      ? const SizedBox.square(
                          dimension: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.download_rounded),
                  label: Text(
                    'Ler (FC ${state.table.readFunction.toString().padLeft(2, '0')})',
                  ),
                ),
              ),
              SizedBox(width: s.sm),
              IconButton.outlined(
                tooltip: state.autoRefresh
                    ? 'Parar leitura contínua'
                    : 'Leitura contínua (1 s)',
                isSelected: state.autoRefresh,
                onPressed: onToggleAuto,
                icon: const Icon(Icons.autorenew_rounded),
                selectedIcon: const Icon(Icons.pause_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
