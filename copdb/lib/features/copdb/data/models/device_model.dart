import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/device.dart';
import 'model.dart';

part 'device_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AndroidDeviceModel extends Device implements Model {
  factory AndroidDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$AndroidDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$AndroidDeviceModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class iOSDeviceModel extends Device implements Model {
  factory iOSDeviceModel.fromJson(Map<String, dynamic> json) =>
      _$iOSDeviceModelFromJson(json);
  Map<String, dynamic> toJson() => _$iOSDeviceModelToJson(this);
}