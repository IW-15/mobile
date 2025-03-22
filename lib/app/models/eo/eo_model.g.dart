// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EoModel _$EoModelFromJson(Map<String, dynamic> json) => EoModel(
      address: json['address'] as String,
      document: json['document'] as String,
      email: json['email'] as String,
      id: (json['id'] as num).toInt(),
      id_user: (json['id_user'] as num).toInt(),
      name: json['name'] as String,
      nib: json['nib'] as String,
      pic: json['pic'] as String,
      picPhone: json['picPhone'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EoModelToJson(EoModel instance) => <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'id_user': instance.id_user,
      'name': instance.name,
      'nib': instance.nib,
      'pic': instance.pic,
      'picPhone': instance.picPhone,
      'email': instance.email,
      'address': instance.address,
      'document': instance.document,
    };
