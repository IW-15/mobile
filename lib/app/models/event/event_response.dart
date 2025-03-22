import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/event/event_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

@JsonSerializable()
class EventsResponse implements ModelFactory {
  final Map<String, List<EventModel>>? events;

  EventsResponse({required this.events});

  factory EventsResponse.fromJson(Map<String, dynamic> json) {
    final eventsMap = json.map((key, value) {
      return MapEntry(key,
          (value as List).map((event) => EventModel.fromJson(event)).toList());
    });

    return EventsResponse(events: eventsMap);
  }
}
