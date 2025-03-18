// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repayment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepaymentModel _$RepaymentModelFromJson(Map<String, dynamic> json) =>
    RepaymentModel(
      amount: (json['amount'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$RepaymentModelToJson(RepaymentModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'order': instance.order,
      'amount': instance.amount,
    };
