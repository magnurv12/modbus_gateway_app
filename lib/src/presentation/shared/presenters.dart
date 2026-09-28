import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../design_system/design_system.dart';

/// Texto e ícone de uma [Failure] para o operador.
///
/// Toda mensagem responde a três perguntas: o que aconteceu, por que
/// provavelmente aconteceu e o que fazer.
extension FailurePresenter on Failure {
  /// Título curto.
  String get title => switch (this) {
        GatewayUnreachableFailure() => 'Gateway inacessível',
        RequestTimeoutFailure() => 'Gateway não respondeu',
        SlaveTimeoutFailure() => 'Escravo Modbus sem resposta',
        ModbusExceptionFailure(:final code) => switch (code) {
            'illegal_address' => 'Endereço inexistente no escravo',
            'illegal_function' => 'Função não suportada pelo escravo',
            'illegal_value' => 'Valor rejeitado pelo escravo',
            'slave_failure' => 'Falha interna do escravo',
            _ => 'Resposta Modbus inválida',
          },
        GatewayBusyFailure() => 'Gateway ocupado',
        ReadOnlyFailure() => 'Tabela somente leitura',
        InvalidRequestFailure() => 'Requisição recusada',
        ValidationFailure() => 'Valor inválido',
        ConfigurationFailure() => 'Mapa da planta inválido',
        UnexpectedFailure() => 'Algo deu errado',
      };

  /// Explicação para o operador.
  String get message => switch (this) {
        GatewayUnreachableFailure() =>
          'Não foi possível conectar ao gateway. Verifique se o celular está '
              'na mesma rede Wi-Fi e se o ESP32 está ligado.',
        RequestTimeoutFailure() =>
          'O gateway demorou demais para responder. A rede pode estar '
              'instável ou o gateway sobrecarregado.',
        SlaveTimeoutFailure() =>
          'O gateway está online, mas o escravo não respondeu no barramento '
              'RS-485. Confira fiação A/B, id do escravo e baud rate.',
        ModbusExceptionFailure(:final message) => message.isNotEmpty
            ? message
            : 'O dispositivo recusou a operação.',
        GatewayBusyFailure() =>
          'A fila de requisições do gateway está cheia (8 pendentes). '
              'Aguarde um instante e tente de novo.',
        ReadOnlyFailure() =>
          'Input registers e entradas discretas não podem ser escritos '
              'via Modbus.',
        InvalidRequestFailure(:final message) =>
          message.isNotEmpty ? message : 'O gateway rejeitou os parâmetros.',
        ValidationFailure(:final message) => message,
        ConfigurationFailure(:final message) => message,
        UnexpectedFailure() =>
          'Recebemos uma resposta inesperada. Tente novamente.',
      };

  /// Detalhe técnico (código Modbus, endereço) para quem está integrando.
  String? get technicalHint {
    final context = switch (this) {
      SlaveTimeoutFailure(:final context) => context,
      ModbusExceptionFailure(:final context) => context,
      _ => null,
    };
    return switch (this) {
      GatewayUnreachableFailure(:final detail) when detail.isNotEmpty => detail,
      UnexpectedFailure(:final detail) when detail.isNotEmpty => detail,
      InvalidRequestFailure(:final code) => 'erro: $code',
      _ when context != null => [
          if (context.slave != null) 'escravo ${context.slave}',
          if (context.functionCode != null)
            'FC ${context.functionCode.toString().padLeft(2, '0')}',
          if (context.table != null) context.table,
          if (context.address != null) 'end. ${context.address}',
          if (context.modbusCode != null)
            'código ${context.modbusCode} (${modbusCodeName(context.modbusCode!)})',
        ].join(' · '),
      _ => null,
    };
  }

  /// Ícone.
  IconData get icon => switch (this) {
        GatewayUnreachableFailure() => Icons.wifi_off_rounded,
        RequestTimeoutFailure() => Icons.hourglass_bottom_rounded,
        SlaveTimeoutFailure() => Icons.cable_rounded,
        ModbusExceptionFailure() => Icons.memory_rounded,
        GatewayBusyFailure() => Icons.traffic_rounded,
        ReadOnlyFailure() => Icons.lock_outline_rounded,
        InvalidRequestFailure() || ValidationFailure() =>
          Icons.edit_note_rounded,
        ConfigurationFailure() => Icons.description_outlined,
        UnexpectedFailure() => Icons.error_outline_rounded,
      };

  /// Tom visual.
  DsTone get tone => switch (this) {
        GatewayUnreachableFailure() ||
        SlaveTimeoutFailure() ||
        RequestTimeoutFailure() =>
          DsTone.badQuality,
        ValidationFailure() || GatewayBusyFailure() => DsTone.medium,
        _ => DsTone.critical,
      };
}

/// Significado dos códigos do ModbusMaster.
String modbusCodeName(int code) => switch (code) {
      1 => 'função ilegal',
      2 => 'endereço ilegal',
      3 => 'valor ilegal',
      4 => 'falha no escravo',
      224 => 'id de escravo inválido',
      225 => 'função inválida',
      226 => 'tempo de resposta esgotado',
      227 => 'CRC inválido',
      _ => 'desconhecido',
    };

/// Rótulos das tabelas Modbus.
extension ModbusTablePresenter on ModbusTable {
  /// Nome amigável.
  String get label => switch (this) {
        ModbusTable.holding => 'Holding registers',
        ModbusTable.input => 'Input registers',
        ModbusTable.coils => 'Coils',
        ModbusTable.discrete => 'Entradas discretas',
      };

  /// Nome curto para seletores.
  String get shortLabel => switch (this) {
        ModbusTable.holding => 'Holding',
        ModbusTable.input => 'Input',
        ModbusTable.coils => 'Coils',
        ModbusTable.discrete => 'Discrete',
      };

  /// Prefixo da numeração legada de manuais (`4xxxx`...).
  String get legacyPrefix => switch (this) {
        ModbusTable.coils => '0x',
        ModbusTable.discrete => '1x',
        ModbusTable.input => '3x',
        ModbusTable.holding => '4x',
      };

  /// Descrição do uso típico.
  String get description => switch (this) {
        ModbusTable.holding => '16 bits · leitura/escrita · parâmetros e setpoints',
        ModbusTable.input => '16 bits · somente leitura · medições',
        ModbusTable.coils => '1 bit · leitura/escrita · comandos',
        ModbusTable.discrete => '1 bit · somente leitura · status',
      };
}

/// Rótulos e cores de severidade de alarme.
extension AlarmSeverityPresenter on AlarmSeverity {
  /// Nome.
  String get label => switch (this) {
        AlarmSeverity.critical => 'Crítico',
        AlarmSeverity.high => 'Alto',
        AlarmSeverity.medium => 'Médio',
        AlarmSeverity.low => 'Baixo',
      };

  /// Tom.
  DsTone get tone => switch (this) {
        AlarmSeverity.critical => DsTone.critical,
        AlarmSeverity.high => DsTone.high,
        AlarmSeverity.medium => DsTone.medium,
        AlarmSeverity.low => DsTone.low,
      };

  /// Ícone com **forma** diferente por prioridade (legível sem cor, para
  /// daltônicos — recomendação da ISA-101).
  IconData get icon => switch (this) {
        AlarmSeverity.critical => Icons.report_rounded,
        AlarmSeverity.high => Icons.warning_rounded,
        AlarmSeverity.medium => Icons.error_rounded,
        AlarmSeverity.low => Icons.info_rounded,
      };
}

/// Mapeia a qualidade de domínio para a do design system.
extension TagQualityPresenter on TagReading? {
  /// Qualidade visual.
  DsValueQuality get dsQuality => switch (this?.quality) {
        null => DsValueQuality.pending,
        TagQuality.good => DsValueQuality.good,
        TagQuality.stale => DsValueQuality.stale,
        TagQuality.bad => DsValueQuality.bad,
      };
}

/// Ícones de equipamento.
extension EquipmentTypePresenter on EquipmentType {
  /// Ícone.
  IconData get icon => switch (this) {
        EquipmentType.tank => Icons.propane_tank_outlined,
        EquipmentType.pump => Icons.settings_rounded,
        EquipmentType.valve => Icons.plumbing_rounded,
        EquipmentType.panel => Icons.electrical_services_rounded,
        EquipmentType.generic => Icons.precision_manufacturing_outlined,
      };
}

/// Regras de apresentação de equipamentos.
extension EquipmentPresenter on Equipment {
  /// Tag que representa o estado do equipamento: o primeiro status sem
  /// alarme (ex.: "Em operação"), senão o primeiro comando não momentâneo
  /// (ex.: válvula aberta/fechada).
  TagDefinition? get stateTag {
    for (final tag in tagsWithRole(TagRole.status)) {
      if (tag.alarms.isEmpty) return tag;
    }
    for (final tag in tagsWithRole(TagRole.command)) {
      if (!tag.momentary) return tag;
    }
    return null;
  }
}
