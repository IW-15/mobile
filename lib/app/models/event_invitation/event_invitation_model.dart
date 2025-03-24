import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/models/outlet/outlet_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'event_invitation_model.g.dart';

@JsonSerializable()
class EventInvitationModel extends BaseModel implements ModelFactory {
  final int id;
  final int id_eo;
  final int id_event;
  final int id_sme;
  final int id_outlet;
  final String status;
  final DateTime date;
  final EventModel event;
  final OutletModel outlet;

  const EventInvitationModel({
    required this.date,
    required this.event,
    required this.id,
    required this.id_eo,
    required this.id_event,
    required this.id_outlet,
    required this.id_sme,
    required this.outlet,
    required this.status,
    required super.created_at,
    required super.updated_at,
  });

  factory EventInvitationModel.fromJson(Map<String, dynamic> json) =>
      _$EventInvitationModelFromJson(json);
  Map<String, dynamic> toJson() => _$EventInvitationModelToJson(this);
}
