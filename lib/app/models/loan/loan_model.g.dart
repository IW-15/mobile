// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanModel _$LoanModelFromJson(Map<String, dynamic> json) => LoanModel(
      amount: (json['amount'] as num).toInt(),
      applicationDate: DateTime.parse(json['applicationDate'] as String),
      id: (json['id'] as num).toInt(),
      monthlyBill: (json['monthlyBill'] as num).toInt(),
      status: json['status'] as String,
      tenor: (json['tenor'] as num).toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LoanModelToJson(LoanModel instance) => <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'amount': instance.amount,
      'tenor': instance.tenor,
      'monthlyBill': instance.monthlyBill,
      'applicationDate': instance.applicationDate.toIso8601String(),
      'status': instance.status,
    };
