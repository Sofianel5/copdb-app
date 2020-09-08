import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Device extends Equatable {
  static const TYPES = <String>["iOS", "Android"];
  final String deviceId;
  final String type;
  final int user;
  Device({@required this.deviceId, @required this.type, @required this.user})
      : assert(TYPES.contains(type));

  @override
  List<Object> get props => [deviceId];
}

class AndroidDevice extends Device {
  String board;
  String bootloader;
  String brand;
  String device;
  String display;
  String fingerprint;
  String hardware;
  String host;
  String buildId;
  String manufacturer;
  String model;
  String product;
  String tags;
  String androidType;
  bool isPhysicalDevice;
  String androidId;
  String systemFeatures;
  AndroidDevice(
      {this.board,
      this.bootloader,
      this.brand,
      this.device,
      this.display,
      this.fingerprint,
      this.hardware,
      this.host,
      this.buildId,
      this.manufacturer,
      this.model,
      this.product,
      this.tags,
      this.androidType,
      this.isPhysicalDevice,
      @required this.androidId,
      this.systemFeatures,
      @required int user})
      : super(deviceId: androidId, type: "Android", user: user);
}

class iOSDevice extends Device {
  String name;
  String systemName;
  String systemVersion;
  String model;
  String localizedModel;
  String identifierForVendor;
  bool isPhysicalDevice;
  iOSDevice({
    this.name,
    this.systemName,
    this.systemVersion,
    this.model,
    this.localizedModel,
    @required this.identifierForVendor,
    this.isPhysicalDevice,
    @required int user,
  }) : super(deviceId: identifierForVendor, type: "iOS", user: user);
}
