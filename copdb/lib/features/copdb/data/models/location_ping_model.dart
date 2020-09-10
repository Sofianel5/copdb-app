import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/location_ping.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_ping_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class LocationPingModel extends LocationPing implements Model {
  CoordinatesModel coordinates;
  LocationPingModel(
    this.coordinates,
    DateTime timestamp,
    int user
  ) : super(coordinates: coordinates, timestamp: timestamp, user: user);
  factory LocationPingModel.fromJson(Map<String, dynamic> json) =>
      _$LocationPingModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationPingModelToJson(this);
}