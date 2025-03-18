// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      amount: (json['amount'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      type: json['type'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
