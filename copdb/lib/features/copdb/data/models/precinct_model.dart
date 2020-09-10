import 'package:copdb/features/copdb/data/models/address_model.dart';
import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/data/models/police_department_model.dart';
import 'package:copdb/features/copdb/domain/entities/precinct.dart';
import 'package:json_annotation/json_annotation.dart';

part 'precinct_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PrecinctModel extends Precinct implements Model {
  final PoliceDepartmentModel policeDepartment;
  final CoordinatesModel coordinates;
  final AddressModel address;
  PrecinctModel({
    String name,
    String image,
    bool isHq,
    this.policeDepartment,
    this.coordinates,
    this.address
  }) : super(
    name: name,
    image: image,
    isHq: isHq,
    policeDepartment: policeDepartment,
    coordinates: coordinates,
    address: address
  );
  factory PrecinctModel.fromJson(Map<String, dynamic> json) =>
      _$PrecinctModelFromJson(json);
  Map<String, dynamic> toJson() => _$PrecinctModelToJson(this);
}
