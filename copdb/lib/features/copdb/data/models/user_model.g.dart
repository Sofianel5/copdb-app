// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    id: json['id'] as int,
    username: json['username'] as String,
    email: json['email'] as String,
    profilePic: json['profile_pic'] as String,
    dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
    dateJoined: json['date_joined'] == null
        ? null
        : DateTime.parse(json['date_joined'] as String),
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    verified: json['verified'] as bool,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'username': instance.username,
      'last_name': instance.lastName,
      'profile_pic': instance.profilePic,
      'dob': instance.dob?.toIso8601String(),
      'date_joined': instance.dateJoined?.toIso8601String(),
      'verified': instance.verified,
    };
