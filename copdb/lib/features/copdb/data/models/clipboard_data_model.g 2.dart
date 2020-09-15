// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clipboard_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClipboardDataModel _$ClipboardDataModelFromJson(Map<String, dynamic> json) {
  return ClipboardDataModel(
    data: json['data'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    user: json['user'] as int,
  );
}

Map<String, dynamic> _$ClipboardDataModelToJson(ClipboardDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'timestamp': instance.timestamp?.toIso8601String(),
      'data': instance.data,
    };
