// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'precinct_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrecinctModel _$PrecinctModelFromJson(Map<String, dynamic> json) {
  return PrecinctModel(
    name: json['name'] as String,
    image: json['image'] as String,
    isHq: json['is_hq'] as bool,
    policeDepartment: json['police_department'] == null
        ? null
        : PoliceDepartmentModel.fromJson(
            json['police_department'] as Map<String, dynamic>),
    coordinates: json['coordinates'] == null
        ? null
        : CoordinatesModel.fromJson(
            json['coordinates'] as Map<String, dynamic>),
    address: json['address'] == null
        ? null
        : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PrecinctModelToJson(PrecinctModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'is_hq': instance.isHq,
      'police_department': instance.policeDepartment?.toJson(),
      'coordinates': instance.coordinates?.toJson(),
      'address': instance.address?.toJson(),
    };
