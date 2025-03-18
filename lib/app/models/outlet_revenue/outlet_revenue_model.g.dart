// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_revenue_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletRevenueModel _$OutletRevenueModelFromJson(Map<String, dynamic> json) =>
    OutletRevenueModel(
      id: (json['id'] as num).toInt(),
      label: json['label'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$OutletRevenueModelToJson(OutletRevenueModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'label': instance.label,
    };
