// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkInfoModel _$NetworkInfoModelFromJson(Map<String, dynamic> json) {
  return NetworkInfoModel(
    json['ip_address'] as String,
    json['ssid'] as String,
    json['bssid'] as String,
    json['user'] as int,
  );
}

Map<String, dynamic> _$NetworkInfoModelToJson(NetworkInfoModel instance) =>
    <String, dynamic>{
      'ip_address': instance.ipAddress,
      'ssid': instance.ssid,
      'bssid': instance.bssid,
      'user': instance.user,
    };
