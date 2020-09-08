import 'package:equatable/equatable.dart';

class NetworkInfo extends Equatable {
  String ipAddress;
  String ssid;
  String bssid;
  int user;
  NetworkInfo({
    this.ipAddress,
    this.ssid,
    this.bssid,
    this.user
  });
  @override
  List<Object> get props => [ipAddress];
}