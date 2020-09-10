import 'package:copdb/features/copdb/data/models/copdbcity_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/police_department.dart';
import 'package:json_annotation/json_annotation.dart';

part 'police_department_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PoliceDepartmentModel extends PoliceDepartment implements Model {
  final CopDBCityModel city;
  PoliceDepartmentModel({
    final String name,
    final String image,
    this.city
  }) : super(
    name: name,
    image: image,
    city: city
  );
  factory PoliceDepartmentModel.fromJson(Map<String, dynamic> json) =>
      _$PoliceDepartmentModelFromJson(json);
  Map<String, dynamic> toJson() => _$PoliceDepartmentModelToJson(this);
}
