import 'package:json_annotation/json_annotation.dart';
import 'package:mobile/app/models/common/base_model.dart';
import 'package:mobile/app/models/outlet_revenue/outlet_revenue_model.dart';
import 'package:mobile/app/services/api/source/model_factory.dart';

part 'outlet_model.g.dart';

@JsonSerializable()
class OutletModel extends BaseModel implements ModelFactory {
  final int id;
  final int id_revenue;
  final int id_merchant;
  final int id_user;
  final String name;
  final String type;
  final String phone;
  final String email;
  final String rekening;
  final String address;
  final OutletRevenueModel revenue;

  const OutletModel({
    required this.address,
    required this.email,
    required this.id,
    required this.id_merchant,
    required this.id_revenue,
    required this.id_user,
    required this.name,
    required this.phone,
    required this.rekening,
    required this.type,
    required this.revenue,
    required super.created_at,
    required super.updated_at,
  });

  factory OutletModel.fromJson(Map<String, dynamic> json) =>
      _$OutletModelFromJson(json);
  Map<String, dynamic> toJson() => _$OutletModelToJson(this);
}
