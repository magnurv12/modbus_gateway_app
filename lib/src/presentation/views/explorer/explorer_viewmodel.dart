import 'dart:async';

import '../../../core/mvvm/mvvm.dart';
import '../../../domain/domain.dart';
import '../../shared/presenters.dart';
import 'explorer_state.dart';

/// View model do explorador Modbus.
class ExplorerViewModel extends ViewModel<ExplorerState>
    with ViewModelEffects<ExplorerState, ExplorerEffect> {
  final IReadModbusBlockUseCase _read;
  final IWriteModbusValuesUseCase _write;

  /// Intervalo da leitura contínua.
  final Duration autoRefreshInterval;

  /// Entradas mantidas no log.
  static const int logCapacity = 20;

  Timer? _autoTimer;

  /// Cria um [ExplorerViewModel].
  ExplorerViewModel(
    this._read,
    this._write, {
    required int defaultSlave,
    this.autoRefreshInterval = const Duration(seconds: 1),
  }) : super(ExplorerState(slave: defaultSlave));

  /// Troca a tabela (limpa o resultado anterior).
  void setTable(ModbusTable table) {
    emit(state.copyWith(
      table: table,
      block: null,
      failure: null,
      status: ExplorerStatus.idle,
      count: state.count.clamp(1, table.maxReadCount),
    ));
  }

  /// Atualiza a faixa consultada. Valores inválidos são validados pelo
  /// caso de uso na leitura, com mensagem para o operador.
  void updateQuery({int? slave, int? start, int? count}) {
    emit(state.copyWith(
      slave: slave ?? state.slave,
      start: start ?? state.start,
      count: count ?? state.count,
    ));
  }

  /// Lê a faixa configurada.
  Future<void> read() async {
    if (state.isBusy) return;
    final query = state;
    emit(query.copyWith(status: ExplorerStatus.loading));

    final watch = Stopwatch()..start();
    final result = await _read(
      table: query.table,
      start: query.start,
      count: query.count,
      slave: query.slave,
    );
    watch.stop();

    final op = 'FC${query.table.readFunction.toString().padLeft(2, '0')} '
        '${query.table.path} ${query.start}+${query.count} @${query.slave}';
    result.fold(
      (failure) {
        _stopAutoRefreshOnPermanent(failure);
        emit(state.copyWith(
          status: ExplorerStatus.failure,
          failure: failure,
          latency: watch.elapsed,
          log: _append(op, ok: false, latency: watch.elapsed, detail: failure),
        ));
      },
      (block) => emit(state.copyWith(
        status: ExplorerStatus.success,
        block: block,
        failure: null,
        latency: watch.elapsed,
        log: _append(op, ok: true, latency: watch.elapsed),
      )),
    );
  }

  /// Escreve [value] em [address] e relê a faixa.
  Future<void> write(int address, int value) async {
    if (state.writingAddress != null) return;
    final table = state.table;
    emit(state.copyWith(writingAddress: address));

    final watch = Stopwatch()..start();
    final result = await _write(
      table: table,
      start: address,
      values: [value],
      slave: state.slave,
    );
    watch.stop();

    final fc = table.isBit ? '05' : '06';
    final op = 'FC$fc ${table.path} $address=$value @${state.slave}';
    emit(state.copyWith(
      writingAddress: null,
      log: _append(
        op,
        ok: result.isRight,
        latency: watch.elapsed,
        detail: result.isLeft ? result.left : null,
      ),
    ));

    result.fold(
      (failure) => emitEffect(ExplorerWriteFailed(failure)),
      (_) {
        emitEffect(ExplorerWriteConfirmed(
          'Escrita confirmada em ${table.path} $address '
          '(${watch.elapsedMilliseconds} ms)',
        ));
        unawaited(read());
      },
    );
  }

  /// Liga/desliga a leitura contínua.
  void toggleAutoRefresh() {
    final enable = !state.autoRefresh;
    _autoTimer?.cancel();
    _autoTimer = null;
    if (enable) {
      _autoTimer = Timer.periodic(autoRefreshInterval, (_) => read());
      unawaited(read());
    }
    emit(state.copyWith(autoRefresh: enable));
  }

  /// Erros que não se resolvem sozinhos param a leitura contínua para não
  /// martelar o barramento com a mesma requisição inválida.
  void _stopAutoRefreshOnPermanent(Failure failure) {
    if (!state.autoRefresh || failure.isTransient) return;
    _autoTimer?.cancel();
    _autoTimer = null;
    emit(state.copyWith(autoRefresh: false));
  }

  List<ExplorerLogEntry> _append(
    String operation, {
    required bool ok,
    required Duration latency,
    Failure? detail,
  }) {
    final entry = ExplorerLogEntry(
      at: DateTime.now(),
      operation: operation,
      ok: ok,
      latency: latency,
      detail: detail?.title,
    );
    return [entry, ...state.log.take(logCapacity - 1)];
  }

  @override
  Future<void> close() {
    _autoTimer?.cancel();
    return super.close();
  }
}
