import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/coordinates.dart';
import 'model.dart';

part 'coordinates_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CoordinatesModel extends Coordinates implements Model {
  CoordinatesModel(
    double lat,
    double lng,
    int id,
  ) : super(lat: lat, lng: lng);
  factory CoordinatesModel.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesModelFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesModelToJson(this);
}
