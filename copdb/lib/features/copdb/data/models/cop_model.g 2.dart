// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopModel _$CopModelFromJson(Map<String, dynamic> json) {
  return CopModel(
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    sex: json['sex'] as String,
    ethnicity: json['ethnicity'] as String,
    age: json['age'] as int,
    rank: json['rank'] as String,
    badgeNumber: json['badge_number'] as String,
    precinct: json['precinct'] == null
        ? null
        : PrecinctModel.fromJson(json['precinct'] as Map<String, dynamic>),
    description: json['description'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$CopModelToJson(CopModel instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'sex': instance.sex,
      'ethnicity': instance.ethnicity,
      'age': instance.age,
      'rank': instance.rank,
      'badge_number': instance.badgeNumber,
      'description': instance.description,
      'image': instance.image,
      'precinct': instance.precinct?.toJson(),
    };
