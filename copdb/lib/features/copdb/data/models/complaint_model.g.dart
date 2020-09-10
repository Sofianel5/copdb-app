// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintModel _$ComplaintModelFromJson(Map<String, dynamic> json) {
  return ComplaintModel(
    abuseType: json['abuse_type'] as String,
    allegation: json['allegation'] as String,
    cop: json['cop'] == null
        ? null
        : CopModel.fromJson(json['cop'] as Map<String, dynamic>),
    complainantName: json['complainant_name'] as String,
    complainantGender: json['complainant_gender'] as String,
    complainantEthnicity: json['complainant_ethnicity'] as String,
    complainantAge: json['complainant_age'] as String,
    contactReason: json['contact_reason'] as String,
    dateRecieved: json['date_recieved'] == null
        ? null
        : DateTime.parse(json['date_recieved'] as String),
    description: json['description'] as String,
    outcome: json['outcome'] as String,
    finding: json['finding'] as String,
  );
}

Map<String, dynamic> _$ComplaintModelToJson(ComplaintModel instance) =>
    <String, dynamic>{
      'abuse_type': instance.abuseType,
      'allegation': instance.allegation,
      'complainant_name': instance.complainantName,
      'complainant_gender': instance.complainantGender,
      'complainant_ethnicity': instance.complainantEthnicity,
      'complainant_age': instance.complainantAge,
      'contact_reason': instance.contactReason,
      'date_recieved': instance.dateRecieved?.toIso8601String(),
      'description': instance.description,
      'outcome': instance.outcome,
      'finding': instance.finding,
      'cop': instance.cop?.toJson(),
    };
