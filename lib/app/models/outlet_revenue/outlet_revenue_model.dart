import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'outlet_revenue_model.g.dart';

@JsonSerializable()
class OutletRevenueModel extends BaseModel implements ModelFactory {
  final int id;
  final String label;

  const OutletRevenueModel({
    required this.id,
    required this.label,
    required super.created_at,
    required super.updated_at,
  });

  factory OutletRevenueModel.fromJson(Map<String, dynamic> json) =>
      _$OutletRevenueModelFromJson(json);
  Map<String, dynamic> toJson() => _$OutletRevenueModelToJson(this);
}
