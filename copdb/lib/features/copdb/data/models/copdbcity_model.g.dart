// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copdbcity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopDBCityModel _$CopDBCityModelFromJson(Map<String, dynamic> json) {
  return CopDBCityModel(
    name: json['name'] as String,
    hq: json['hq'] == null
        ? null
        : AddressModel.fromJson(json['hq'] as Map<String, dynamic>),
    epicenter: json['epicenter'] == null
        ? null
        : CoordinatesModel.fromJson(json['epicenter'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CopDBCityModelToJson(CopDBCityModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'hq': instance.hq?.toJson(),
      'epicenter': instance.epicenter?.toJson(),
    };
