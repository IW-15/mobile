// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanProfileModel _$LoanProfileModelFromJson(Map<String, dynamic> json) =>
    LoanProfileModel(
      id: (json['id'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      maxAmount: (json['maxAmount'] as num).toInt(),
      minAmount: (json['minAmount'] as num).toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$LoanProfileModelToJson(LoanProfileModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'minAmount': instance.minAmount,
      'limit': instance.limit,
      'maxAmount': instance.maxAmount,
      'id': instance.id,
    };
