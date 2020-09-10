import 'package:copdb/features/copdb/data/models/address_model.dart';
import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/copdbcity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'copdbcity_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CopDBCityModel extends CopDBCity implements Model {
  final AddressModel hq;
  final CoordinatesModel epicenter;
  CopDBCityModel({
    final String name,
    this.hq,
    this.epicenter,
  }) : super(
    name: name,
    hq: hq,
    epicenter: epicenter
  );
  factory CopDBCityModel.fromJson(Map<String, dynamic> json) =>
      _$CopDBCityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CopDBCityModelToJson(this);
}
