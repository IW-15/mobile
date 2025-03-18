// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cashflow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CashflowModel _$CashflowModelFromJson(Map<String, dynamic> json) =>
    CashflowModel(
      history: (json['history'] as List<dynamic>)
          .map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      income: (json['income'] as num).toInt(),
      outcome: (json['outcome'] as num).toInt(),
    );

Map<String, dynamic> _$CashflowModelToJson(CashflowModel instance) =>
    <String, dynamic>{
      'income': instance.income,
      'outcome': instance.outcome,
      'history': instance.history,
    };
