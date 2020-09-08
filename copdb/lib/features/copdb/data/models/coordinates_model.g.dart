// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesModel _$CoordinatesModelFromJson(Map<String, dynamic> json) {
  return CoordinatesModel(
    (json['lat'] as num)?.toDouble(),
    (json['lng'] as num)?.toDouble(),
    json['id'] as int,
  );
}

Map<String, dynamic> _$CoordinatesModelToJson(CoordinatesModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
    };
