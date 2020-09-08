import 'dart:convert';

import 'package:geolocator/geolocator.dart' as geo;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/clipboard_data.dart';
import '../../domain/entities/coordinates.dart';
import '../../domain/entities/device.dart';
import '../../domain/entities/user.dart';
import '../models/coordinates_model.dart';
import '../models/user_model.dart';

abstract class LocalDataSource {
  Future<String> getAuthToken() {}
  Future<void> cacheAuthToken(String token) {}
  Future<void> clearData() {}
  Future<void> cacheUser(UserModel user) {}
  Future<User> getCachedUser() {}
  Future<Map<String, String>> getAndroidDeviceInfo() {}
  Future<Map<String, String>> getiOSDeviceInfo() {}
  Future<Coordinates> getCoordinates() {}
  Future<NetworkInfo> getNetworkInfo() {}
  Future<Device> getDeviceInfo() {}
  Future<ClipboardData> getClipboardData() {}
}

const String AUTH_TOKEN_KEY = "authtoken";
const String VENUES_KEY = "venues";
const String USER_KEY = "user";

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  LocalDataSourceImpl(this.sharedPreferences);

  Future<String> _getString(String key) {
    final String str = sharedPreferences.getString(key);
    if (str != null) {
      return Future.value(str);
    } else {
      throw CacheException();
    }
  }

  Future<Map<String, dynamic>> _getJson(String key) async {
    try {
      String result = await _getString(key);
      return json.decode(result);
    } on CacheException {
      throw CacheException();
    }
  }

  Future<void> _setString(String key, String value) async {
    try {
      sharedPreferences.setString(key, value);
      return;
    } on Exception {
      throw CacheException();
    }
  }

  Future<void> _setJson(String key, Map<String, dynamic> data) async {
    try {
      final String str = json.encode(data);
      return await _setString(key, str);
    } on CacheException {
      throw CacheException();
    }
  }

  @override
  Future<String> getAuthToken() {
    return _getString(AUTH_TOKEN_KEY);
  }

  @override
  Future<void> cacheAuthToken(String token) async {
    return await _setString(AUTH_TOKEN_KEY, token);
  }

  @override
  Future<void> clearData() async {
    try {
      final pref = await SharedPreferences.getInstance();
      await pref.clear();
      return;
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    Map<String, dynamic> userJson = user.toJson();
    return await _setJson(USER_KEY, userJson);
  }

  @override
  Future<User> getCachedUser() async {
    Map<String, dynamic> userJson = await _getJson(USER_KEY);
    return UserModel.fromJson(userJson);
  }

  @override
  Future<Map<String, String>> getAndroidDeviceInfo() {
    // TODO: implement getAndroidDeviceInfo
    throw UnimplementedError();
  }

  @override
  Future<Coordinates> getCoordinates() async {
    try {
      final level = geo.GeolocationPermission.locationWhenInUse;
      geo.Geolocator locator = geo.Geolocator()..forceAndroidLocationManager = true;
      geo.Position position = await locator.getCurrentPosition(desiredAccuracy: geo.LocationAccuracy.medium, locationPermissionLevel: level);
      if (position == null) {
        position = await locator.getLastKnownPosition(desiredAccuracy: geo.LocationAccuracy.medium, locationPermissionLevel: level);
      }
      Map<String, double> coordinates = {
        "lat": position.latitude,
        "lng": position.longitude
      };
      print(coordinates);
      final coords = CoordinatesModel.fromJson(coordinates);
      return coords;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<Map<String, String>> getiOSDeviceInfo() {
    // TODO: implement getiOSDeviceInfo
    throw UnimplementedError();
  }

  @override
  Future<ClipboardData> getClipboardData() {
    // TODO: implement getClipboardData
    throw UnimplementedError();
  }

  @override
  Future<Device> getDeviceInfo() {
    // TODO: implement getDeviceInfo
    throw UnimplementedError();
  }

  @override
  Future<NetworkInfo> getNetworkInfo() {
    // TODO: implement getNetworkInfo
    throw UnimplementedError();
  }
}
