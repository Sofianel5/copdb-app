// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AndroidDeviceModel _$AndroidDeviceModelFromJson(Map<String, dynamic> json) {
  return AndroidDeviceModel(
    type: json['type'] as String,
    board: json['board'] as String,
    bootloader: json['bootloader'] as String,
    brand: json['brand'] as String,
    device: json['device'] as String,
    display: json['display'] as String,
    fingerprint: json['fingerprint'] as String,
    hardware: json['hardware'] as String,
    host: json['host'] as String,
    buildId: json['build_id'] as String,
    manufacturer: json['manufacturer'] as String,
    model: json['model'] as String,
    product: json['product'] as String,
    tags: json['tags'] as String,
    androidType: json['android_type'] as String,
    isPhysicalDevice: json['is_physical_device'] as bool,
    androidId: json['android_id'] as String,
    systemFeatures: json['system_features'] as String,
    user: json['user'] as int,
  );
}

Map<String, dynamic> _$AndroidDeviceModelToJson(AndroidDeviceModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'user': instance.user,
      'board': instance.board,
      'bootloader': instance.bootloader,
      'brand': instance.brand,
      'device': instance.device,
      'display': instance.display,
      'fingerprint': instance.fingerprint,
      'hardware': instance.hardware,
      'host': instance.host,
      'build_id': instance.buildId,
      'manufacturer': instance.manufacturer,
      'model': instance.model,
      'product': instance.product,
      'tags': instance.tags,
      'android_type': instance.androidType,
      'is_physical_device': instance.isPhysicalDevice,
      'android_id': instance.androidId,
      'system_features': instance.systemFeatures,
    };

iOSDeviceModel _$iOSDeviceModelFromJson(Map<String, dynamic> json) {
  return iOSDeviceModel(
    type: json['type'] as String,
    name: json['name'] as String,
    systemName: json['system_name'] as String,
    systemVersion: json['system_version'] as String,
    model: json['model'] as String,
    localizedModel: json['localized_model'] as String,
    identifierForVendor: json['identifier_for_vendor'] as String,
    isPhysicalDevice: json['is_physical_device'] as bool,
    user: json['user'] as int,
  );
}

Map<String, dynamic> _$iOSDeviceModelToJson(iOSDeviceModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'user': instance.user,
      'name': instance.name,
      'system_name': instance.systemName,
      'system_version': instance.systemVersion,
      'model': instance.model,
      'localized_model': instance.localizedModel,
      'identifier_for_vendor': instance.identifierForVendor,
      'is_physical_device': instance.isPhysicalDevice,
    };
