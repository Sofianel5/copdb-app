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
    prefix: json['prefix'] as String,
    suffix: json['suffix'] as String,
    familyName: json['family_name'] as String,
    emails: (json['emails'] as List)?.map((e) => e as String)?.toList(),
    phones: (json['phones'] as List)?.map((e) => e as String)?.toList(),
    addresses: (json['addresses'] as List)?.map((e) => e as String)?.toList(),
    company: json['company'] as String,
    jobTitle: json['job_title'] as String,
    addressesRaw: json['addresses_raw'] as String,
    emailsRaw: json['emails_raw'] as String,
    phonesRaw: json['phones_raw'] as String,
  );
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
      'emails': instance.emails,
      'phones': instance.phones,
      'addresses': instance.addresses,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'emails_raw': instance.emailsRaw,
      'phones_raw': instance.phonesRaw,
      'addresses_raw': instance.addressesRaw,
    };
