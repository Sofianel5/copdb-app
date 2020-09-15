// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_ping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationPingModel _$LocationPingModelFromJson(Map<String, dynamic> json) {
  return LocationPingModel(
    json['coordinates'] == null
        ? null
        : CoordinatesModel.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    json['user'] as int,
  );
}

Map<String, dynamic> _$LocationPingModelToJson(LocationPingModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'user': instance.user,
      'coordinates': instance.coordinates?.toJson(),
    };
