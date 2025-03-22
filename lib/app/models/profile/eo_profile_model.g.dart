// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eo_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EoProfileModel _$EoProfileModelFromJson(Map<String, dynamic> json) =>
    EoProfileModel(
      eo: EoModel.fromJson(json['eo'] as Map<String, dynamic>),
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EoProfileModelToJson(EoProfileModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'eo': instance.eo,
    };
