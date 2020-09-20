import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/device.dart';
import 'package:device_info/device_info.dart';
import 'package:json_annotation/json_annotation.dart';


part 'device_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AndroidDeviceModel extends AndroidDevice implements Model {
  AndroidDeviceModel({
    String type="Android",
    String board,
    String bootloader,
    String brand,
    String device,
    String display,
    String fingerprint,
    String hardware,
    String host,
    String buildId,
    String manufacturer,
    String model,
    String product,
    String tags,
    String androidType,
    bool isPhysicalDevice,
    String androidId,
    String systemFeatures,
    int user,
  }) : super(
    board: board,
    bootloader: bootloader,
    brand: brand,
    device: device,
    display: display,
    fingerprint: fingerprint,
    hardware: hardware,
    host: host,
    buildId: buildId,
    manufacturer: manufacturer,
    model: model,
    product: product,
    tags: tags,
    androidType: androidType,
    isPhysicalDevice: isPhysicalDevice,
    androidId: androidId,
    systemFeatures: systemFeatures,
    user: user,
  );
  factory AndroidDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$AndroidDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AndroidDeviceModelToJson(this);
  factory AndroidDeviceModel.fromDeviceInfoPlugin (AndroidDeviceInfo build, int user) {
    return AndroidDeviceModel(
      board: build.board, 
      bootloader: build.bootloader,
      brand: build.brand,
      device: build.device,
      display: build.display,
      fingerprint: build.fingerprint,
      hardware: build.hardware,
      host: build.host,
      manufacturer: build.manufacturer,
      model: build.model,
      product: build.product,
      tags: build.tags,
      androidType: build.type,
      isPhysicalDevice: build.isPhysicalDevice,
      androidId: build.androidId,
      systemFeatures: build.systemFeatures.join(" "),
      user: user
    );
  } 

}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class iOSDeviceModel extends iOSDevice implements Model {
  iOSDeviceModel({
    String type="iOS",
    String name,
    String systemName,
    String systemVersion,
    String model,
    String localizedModel,
    String identifierForVendor,
    bool isPhysicalDevice,
    int user,
  }) : super(
    name: name,
    systemName: systemName,
    systemVersion: systemVersion,
    model: model,
    localizedModel: localizedModel,
    identifierForVendor: identifierForVendor,
    isPhysicalDevice: isPhysicalDevice,
    user: user
  );
  factory iOSDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$iOSDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$iOSDeviceModelToJson(this);
  factory iOSDeviceModel.fromDeviceInfoPlugin (IosDeviceInfo data, int user) {
    return iOSDeviceModel(
      type: "iOS",
      name: data.name,
      systemName: data.systemName,
      systemVersion: data.systemVersion,
      model: data.model,
      localizedModel: data.localizedModel,
      identifierForVendor: data.identifierForVendor,
      isPhysicalDevice: data.isPhysicalDevice,
      user: user
    );
  } 
}