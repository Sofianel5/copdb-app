// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactModel _$ContactModelFromJson(Map<String, dynamic> json) {
  return ContactModel(
    user: json['user'] as int,
    displayName: json['display_name'] as String,
    givenName: json['given_name'] as String,
    middleName: json['middle_name'] as String,
    avatar: json['avatar'] as String,
    prefix: json['prefix'] as String,
    suffix: json['suffix'] as String,
    familyName: json['family_name'] as String,
    avatarBase64: json['avatar_base64'] as String,
    addresses: (json['addresses'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    emails: (json['emails'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    phones: (json['phones'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    company: json['company'] as String,
    jobTitle: json['job_title'] as String,
    referencedUser: json['referenced_user'] == null
        ? null
        : UserModel.fromJson(json['referenced_user'] as Map<String, dynamic>),
    areFriends: json['are_friends'] as bool,
    added: json['added'] as bool,
  )..invited = json['invited'] as bool;
}

Map<String, dynamic> _$ContactModelToJson(ContactModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'display_name': instance.displayName,
      'given_name': instance.givenName,
      'middle_name': instance.middleName,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'family_name': instance.familyName,
      'phones': instance.phones,
      'emails': instance.emails,
      'avatar_base64': instance.avatarBase64,
      'avatar': instance.avatar,
      'addresses': instance.addresses,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'referenced_user': instance.referencedUser?.toJson(),
      'are_friends': instance.areFriends,
      'added': instance.added,
      'invited': instance.invited,
    };
