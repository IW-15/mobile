// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_score_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditScoreModel _$CreditScoreModelFromJson(Map<String, dynamic> json) =>
    CreditScoreModel(
      id: (json['id'] as num).toInt(),
      indicator: json['indicator'] as String,
      score: (json['score'] as num).toInt(),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$CreditScoreModelToJson(CreditScoreModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'score': instance.score,
      'indicator': instance.indicator,
      'id': instance.id,
    };
