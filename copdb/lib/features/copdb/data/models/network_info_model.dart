
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/network_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network_info_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NetworkInfoModel extends NetworkInfo implements Model {
  NetworkInfoModel(
    String ipAddress,
    String ssid,
    String bssid,
    int user,
  ) : super(
          ipAddress: ipAddress,
          ssid: ssid,
          bssid: bssid,
          user: user,
        );
  factory NetworkInfoModel.fromJson(Map<String, dynamic> json) =>
      _$NetworkInfoModelFromJson(json);
  Map<String, dynamic> toJson() => _$NetworkInfoModelToJson(this);
}
