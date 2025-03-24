// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_invitation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventInvitationModel _$EventInvitationModelFromJson(
        Map<String, dynamic> json) =>
    EventInvitationModel(
      date: DateTime.parse(json['date'] as String),
      event: EventModel.fromJson(json['event'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      id_eo: (json['id_eo'] as num).toInt(),
      id_event: (json['id_event'] as num).toInt(),
      id_outlet: (json['id_outlet'] as num).toInt(),
      id_sme: (json['id_sme'] as num).toInt(),
      outlet: OutletModel.fromJson(json['outlet'] as Map<String, dynamic>),
      status: json['status'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EventInvitationModelToJson(
        EventInvitationModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'id_eo': instance.id_eo,
      'id_event': instance.id_event,
      'id_sme': instance.id_sme,
      'id_outlet': instance.id_outlet,
      'status': instance.status,
      'date': instance.date.toIso8601String(),
      'event': instance.event,
      'outlet': instance.outlet,
    };
