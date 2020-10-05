import 'dart:convert';
import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:contacts_service/contacts_service.dart' as contacts_service;
import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/data/models/copdbevent_model.dart';
import 'package:device_info/device_info.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_ip/get_ip.dart';
import 'package:connectivity/connectivity.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user.dart';
import '../models/model.dart';
import '../models/clipboard_data_model.dart';
import '../models/contact_model.dart';
import '../models/coordinates_model.dart';
import '../models/device_model.dart';
import '../models/network_info_model.dart';
import '../models/user_model.dart';

abstract class LocalDataSource {
  Future<String> getAuthToken() {}
  Future<void> cacheAuthToken(String token) {}
  Future<void> clearData() {}
  Future<void> cacheUser(UserModel user) {}
  Future<User> getCachedUser() {}
  Future<Model> getDeviceInfo() {}
  Future<AndroidDeviceModel> getAndroidDeviceInfo() {}
  Future<iOSDeviceModel> getiOSDeviceInfo() {}
  Future<CoordinatesModel> getCoordinates() {}
  Future<NetworkInfoModel> getNetworkInfo() {}
  Future<ClipboardDataModel> getClipboardData() {}
  Future<List<ContactModel>> getContacts() {}
  Future<void> cacheFeed(List<dynamic> feed);
  Future<List<dynamic>> getCachedFeed();
}

const String AUTH_TOKEN_KEY = "authtoken";
const String USER_KEY = "user";
const String FEED_KEY = "feed";

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;
  final FirebaseMessaging firebaseMessaging;
  LocalDataSourceImpl(this.sharedPreferences, this.firebaseMessaging);

  Future<String> _getString(String key) {
    final String str = sharedPreferences.getString(key);
    if (str != null) {
      return Future.value(str);
    } else {
      throw CacheException();
    }
  }

  Future _getJson(String key) async {
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

  Future<void> _setJson(String key, data) async {
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
      await sharedPreferences.clear();
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

  Future<int> userId() async {
    User user = await getCachedUser();
    return user.id;
  }

  @override
  Future<CoordinatesModel> getCoordinates() async {
    try {
      final level = geo.GeolocationPermission.locationWhenInUse;
      geo.Geolocator locator = geo.Geolocator()
        ..forceAndroidLocationManager = true;
      geo.Position position = await locator.getCurrentPosition(
          desiredAccuracy: geo.LocationAccuracy.medium,
          locationPermissionLevel: level);
      if (position == null) {
        position = await locator.getLastKnownPosition(
            desiredAccuracy: geo.LocationAccuracy.medium,
            locationPermissionLevel: level);
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
  Future<AndroidDeviceModel> getAndroidDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    String firebaseToken;
    try {
      firebaseToken = await firebaseMessaging.getToken();
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      firebaseToken = null;
    }
    return AndroidDeviceModel.fromDeviceInfoPlugin(androidInfo, await userId(), firebaseToken);
  }

  @override
  Future<iOSDeviceModel> getiOSDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    String firebaseToken;
    try {
      firebaseToken = await firebaseMessaging.getToken();
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
      firebaseToken = null;
    }
    return iOSDeviceModel.fromDeviceInfoPlugin(iosInfo, await userId(), firebaseToken);
  }

  @override
  Future<ClipboardDataModel> getClipboardData() async {
    if (Platform.isIOS) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      if (iosInfo.systemVersion.contains("14.")) {
        return null;
      }
    }
    String data = await FlutterClipboard.paste();
    return ClipboardDataModel(
      data: data,
      timestamp: DateTime.now(),
      user: await userId(),
    );
  }

  @override
  Future<Model> getDeviceInfo() async {
    if (Platform.isIOS) {
      return await getiOSDeviceInfo();
    } else if (Platform.isAndroid) {
      return await getAndroidDeviceInfo();
    }
    return null;
  }

  @override
  Future<NetworkInfoModel> getNetworkInfo() async {
    String bssid = await (Connectivity().getWifiBSSID());
    String ip = await GetIp.ipAddress;
    String ssid = await (Connectivity().getWifiName());
    if (bssid == "00:00:00:00:00:00") {
      bssid = null;
      ssid = null;
    }
    int user = await userId();
    return NetworkInfoModel(ip, ssid, bssid, user);
  }

  @override
  Future<List<ContactModel>> getContacts() async {
    var status = await Permission.contacts.status;
    if (status.isUndetermined) {
      if (!(await Permission.contacts.request().isGranted)) {
        throw PermissionException();
      }
    } else if (!(status.isGranted)) {
      throw PermissionException();
    } 
    Iterable<contacts_service.Contact> contacts =
        await contacts_service.ContactsService.getContacts();
    int userid = await userId();
    return contacts
        .toList()
        .map((e) => ContactModel.fromDeviceInfoPlugin(e, userid)).toList();
  }

  @override
  Future<void> cacheFeed(List<dynamic> feed) async {
    feed = feed.map((e) => e.toJson());
    return await _setJson(FEED_KEY, feed);
  }

  @override
  Future<List> getCachedFeed() async {
    List userJson = await _getJson(FEED_KEY);
    List<dynamic> results = [];
    for (var obj in userJson) {
      if (obj["type"].contains("Complaint")) {
        results.add(ComplaintModel.fromJson(obj));
      } else if (obj["type"] == "CopDBEvent") {
        results.add(CopDBEventModel.fromJson(obj));
      }
    }
    return results;
  }
}
