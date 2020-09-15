// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return NotificationModel(
    json['title'] as String,
    json['body'] as String,
    json['data'] as Map<String, dynamic>,
    json['sent_at'] == null ? null : DateTime.parse(json['sent_at'] as String),
  );
}

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'sent_at': instance.sentAt?.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
      'data': instance.data,
    };
