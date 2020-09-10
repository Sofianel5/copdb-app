// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'police_department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoliceDepartmentModel _$PoliceDepartmentModelFromJson(
    Map<String, dynamic> json) {
  return PoliceDepartmentModel(
    name: json['name'] as String,
    image: json['image'] as String,
    city: json['city'] == null
        ? null
        : CopDBCityModel.fromJson(json['city'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoliceDepartmentModelToJson(
        PoliceDepartmentModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'city': instance.city?.toJson(),
    };
