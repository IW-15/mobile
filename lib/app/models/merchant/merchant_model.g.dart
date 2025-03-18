// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel(
      address: json['address'] as String,
      applyForm: json['applyForm'] as String?,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      ktp: json['ktp'] as String?,
      license: json['license'] as String?,
      name: json['name'] as String,
      npwp: json['npwp'] as String?,
      phone: json['phone'] as String,
      photo: json['photo'] as String?,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'applyForm': instance.applyForm,
      'ktp': instance.ktp,
      'photo': instance.photo,
      'license': instance.license,
      'npwp': instance.npwp,
    };
