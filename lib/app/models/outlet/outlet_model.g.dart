// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outlet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutletModel _$OutletModelFromJson(Map<String, dynamic> json) => OutletModel(
      address: json['address'] as String,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      id_merchant: (json['id_merchant'] as num).toInt(),
      id_revenue: (json['id_revenue'] as num).toInt(),
      id_user: (json['id_user'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      rekening: json['rekening'] as String,
      type: json['type'] as String,
      revenue: json['revenue'] == null
          ? null
          : OutletRevenueModel.fromJson(
              json['revenue'] as Map<String, dynamic>),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      eventOpen: json['eventOpen'] as bool,
      score: json['score'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$OutletModelToJson(OutletModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'id_revenue': instance.id_revenue,
      'id_merchant': instance.id_merchant,
      'id_user': instance.id_user,
      'name': instance.name,
      'type': instance.type,
      'phone': instance.phone,
      'email': instance.email,
      'rekening': instance.rekening,
      'address': instance.address,
      'revenue': instance.revenue,
      'eventOpen': instance.eventOpen,
      'score': instance.score,
      'image': instance.image,
    };
