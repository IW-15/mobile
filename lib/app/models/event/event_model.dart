import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends BaseModel implements ModelFactory {
  final int id;
  final int id_eo;
  final String name;
  final DateTime date;
  final String time;
  final String category;
  final String location;
  final double latitude;
  final double longitude;
  final String venue;
  final int visitorNumber;
  final int tenantNumber;
  final int tenantPrice;
  final String description;
  final String status;
  final String pic;
  final String banner;
  final String picNumber;

  EventModel({
    required this.id,
    required this.id_eo,
    required this.name,
    required this.date,
    required this.time,
    required this.category,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.venue,
    required this.visitorNumber,
    required this.tenantNumber,
    required this.tenantPrice,
    required this.description,
    required this.status,
    required this.pic,
    required this.banner,
    required this.picNumber,
    required super.created_at,
    required super.updated_at,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
