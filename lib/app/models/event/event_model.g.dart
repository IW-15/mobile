// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: (json['id'] as num).toInt(),
      id_eo: (json['id_eo'] as num).toInt(),
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      time: json['time'] as String,
      category: json['category'] as String,
      location: json['location'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      venue: json['venue'] as String,
      visitorNumber: (json['visitorNumber'] as num).toInt(),
      tenantNumber: (json['tenantNumber'] as num).toInt(),
      tenantPrice: (json['tenantPrice'] as num).toInt(),
      description: json['description'] as String,
      status: (json['status'] ?? "draft") as String,
      pic: json['pic'] as String,
      banner: json['banner'] as String,
      picNumber: json['picNumber'] as String,
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'id': instance.id,
      'id_eo': instance.id_eo,
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'time': instance.time,
      'category': instance.category,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'venue': instance.venue,
      'visitorNumber': instance.visitorNumber,
      'tenantNumber': instance.tenantNumber,
      'tenantPrice': instance.tenantPrice,
      'description': instance.description,
      'status': instance.status,
      'pic': instance.pic,
      'banner': instance.banner,
      'picNumber': instance.picNumber,
    };
