import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/data/models/precinct_model.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cop_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CopModel extends Cop implements Model {
  PrecinctModel precinct;
  CopModel({
    final String firstName,
    final String lastName,
    final String sex,
    final String ethnicity,
    final int age,
    final String rank,
    final String badgeNumber,
    this.precinct,
    final String description,
    final String image,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          sex: sex,
          ethnicity: ethnicity,
          age: age,
          rank: rank,
          badgeNumber: badgeNumber,
          precinct: precinct,
          description: description,
          image: image,
        );
  factory CopModel.fromJson(Map<String, dynamic> json) =>
      _$CopModelFromJson(json);
  Map<String, dynamic> toJson() => _$CopModelToJson(this);
}
