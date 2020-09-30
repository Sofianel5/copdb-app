import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:copdb/core/network/http_override.dart';
import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/data/models/contact_model.dart';
import 'package:copdb/features/copdb/data/models/cop_model.dart';
import 'package:copdb/features/copdb/data/models/copdbevent_model.dart';
import 'package:copdb/features/copdb/data/models/notification_model.dart';
import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:copdb/features/copdb/domain/entities/notification.dart';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:retry/retry.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/urls.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource {
  Future<String> login({String username, String password});
  Future<String> signUp(
      {String email,
      String username,
      DateTime dob,
      String password,
      String firstName,
      String lastName});
  Future<UserModel> getUser(Map<String, dynamic> headers);
  Future<bool> checkUsername(String username);
  Future<bool> checkEmail(String email);
  Future<void> uploadJson(
      String url, dynamic data, Map<String, dynamic> headers);
  Future<List<dynamic>> getFeed(
      String sort, int page, Map<String, dynamic> headers);
  Future<List<CopModel>> getCops(
      String query, int page, Map<String, dynamic> headers);
  Future<void> reportCop(
      CopDBComplaintModel complaint, Map<String, dynamic> headers);
  Future<List<Notification>> getNotifications(
      int page, Map<String, dynamic> headers);
  Future<UserModel> uploadProfilePic(File pic, Map<String, dynamic> headers);
  Future<List<Contact>> uploadContacts(
      List<ContactModel> contacts, Map<String, dynamic> headers);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({@required this.client});

  String urlEncodeMap(Map<String, String> data) {
    return data.keys
        .map((key) =>
            "${Uri.encodeComponent(key)}=${Uri.encodeComponent(data[key])}")
        .join("&");
  }

  Future<http.Response> _getResponse(dynamic data, String url,
      {Map<String, dynamic> headers, bool getMethod = false}) async {
    //print("going to post: ");
    http.Response response;
    //print(data);
    //print("headers: ");
    //print(headers);
    if (getMethod) {
      String urlParams = urlEncodeMap(data);
      response = await retry(
        // Make a GET request
        () => client
            .get(url + "?" + urlParams, headers: headers ?? <String, String>{})
            .timeout(Duration(seconds: 5)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
    } else {
      response = await retry(
        // Make a GET request
        () => client
            .post(url, body: data, headers: headers ?? <String, String>{})
            .timeout(Duration(seconds: 5)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
    }
    //print("contacts: ");
    //print(response.body);
    //print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response;
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else if (response.statusCode ~/ 100 == 5) {
      throw ServerException();
    }
  }

  Future<Map<String, dynamic>> _getJson(Map<String, dynamic> data, String url,
      {Map<String, dynamic> headers, bool useGet = true}) async {
    try {
      //print("headers in gjson: ");
      //print(headers);
      String responseBody =
          (await _getResponse(data, url, headers: headers, getMethod: useGet))
              .body;
      Map<String, dynamic> responseJson =
          Map<String, dynamic>.from(jsonDecode(responseBody));
      return responseJson;
    } catch (e) {
      //print(e);
      throw e;
    }
  }

  @override
  Future<String> login({String username, String password}) async {
    try {
      Map<String, String> data = <String, String>{
        "username": username,
        "password": password,
      };
      var jsonData;
      var response = await retry(
        // Make a GET request
        () => client
            .post(Urls.LOGIN_URL, body: data)
            .timeout(Duration(seconds: 5)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      //print(response.body);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        return jsonData["auth_token"];
      } else if (response.statusCode / 100 == 4) {
        throw AuthenticationException();
      } else {
        throw ServerException();
      }
    } catch (e) {
      //print(e);
      throw e;
    }
  }

  @override
  Future<String> signUp({
    @required String email,
    @required String username,
    @required DateTime dob,
    @required String password,
    @required String firstName,
    @required String lastName,
  }) async {
    try {
      Map<String, String> data = <String, String>{
        "email": email,
        "dob": dob.toIso8601String(),
        "username": username,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
      };
      //print(data);
      http.Response response = await retry(
        // Make a POST request
        () => client
            .post(
              Urls.SIGNUP_URL,
              body: data,
            )
            .timeout(
              Duration(seconds: 5),
            ),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      print(response.body);
      Map<String, dynamic> responseJsonData = Map<String, dynamic>.from(
        json.decode(response.body),
      );
      if (response.statusCode == 201) {
        String token = await login(
          username: responseJsonData["username"],
          password: data['password'],
        );
        return token;
      } else {
        if (responseJsonData["password"] != null) {
          throw SignUpException(
            message:
                "Please provide valid entries to all fields. Note your password must not be too short or common.",
          );
        } else if (responseJsonData["email"] != null &&
            responseJsonData["email"].contains(
              "account with this Email already exists.",
            )) {
          throw SignUpException(
            message:
                "Please provide valid entries to all fields. Note this email is already associated with an account.",
          );
        } else {
          throw SignUpException(
            message: "Please provide valid entries to all fields.",
          );
        }
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<UserModel> getUser(Map<String, dynamic> headers) async {
    try {
      final Map<String, dynamic> jsonData = Map<String, dynamic>.from(
          await _getJson(<String, String>{}, Urls.USER_URL,
              headers: Map<String, String>.from(headers)));
      print(headers);
      return UserModel.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> checkUsername(String username) async {
    try {
      var jsonData;
      var response = await retry(
        // Make a GET request
        () => client
            .get(Urls.CHECK_USERNAME + "?username=" + username)
            .timeout(Duration(seconds: 5)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      //print(response.body);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        return jsonData["available"];
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<void> uploadJson(
      String url, dynamic data, Map<String, dynamic> headers) async {
    data = json.encode(data);
    print(data);
    headers['Content-Type'] = "application/json";
    var response = await retry(
      // Make a POST request
      () => http
          .post(url, headers: headers, body: data)
          .timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print(response.body);
  }

  @override
  Future<List> getFeed(
      String sort, int page, Map<String, dynamic> headers) async {
    var response = await retry(
      // Make a GET request
      () => client
          .get(Urls.FEED_URL + "?page=$page&order_by=$sort", headers: headers)
          .timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> results = [];
      for (var obj in jsonData["results"]) {
        if (obj["type"].contains("Complaint")) {
          results.add(ComplaintModel.fromJson(obj));
        } else if (obj["type"] == "CopDBEvent") {
          results.add(CopDBEventModel.fromJson(obj));
        }
      }
      return results;
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CopModel>> getCops(
      String query, int page, Map<String, dynamic> headers) async {
    var response = await retry(
      // Make a GET request
      () => client
          .get(Urls.COPS_LIST_URL + "?page=$page&q=$query", headers: headers)
          .timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<CopModel> results = [];
      for (var obj in jsonData["results"]) {
        results.add(CopModel.fromJson(obj));
      }
      return results;
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> reportCop(
      CopDBComplaintModel complaint, Map<String, dynamic> headers) {
    return uploadJson(Urls.REPORT_URL, complaint.toJson(), headers);
  }

  @override
  Future<List<Notification>> getNotifications(
      int page, Map<String, dynamic> headers) async {
    var response = await retry(
      // Make a GET request
      () => client
          .get(Urls.GET_NOTIFICATIONS + "?page=$page", headers: headers)
          .timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Notification> results = [];
      for (var obj in jsonData["results"]) {
        results.add(NotificationModel.fromJson(obj));
      }
      return results;
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> uploadProfilePic(
      File pic, Map<String, dynamic> headers) async {
    String base64encoded = base64Encode(pic.readAsBytesSync());
    Map<String, String> body = <String, String>{"img": base64encoded};
    var response = await retry(
      // Make a GET request
      () => client
          .post(Urls.SET_PROFILE_PIC, body: body, headers: headers)
          .timeout(Duration(seconds: 5)),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData);
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<bool> checkEmail(String email) async {
    try {
      var jsonData;
      var response = await retry(
        // Make a GET request
        () => client
            .get(Urls.CHECK_EMAIL + "?email=" + email)
            .timeout(Duration(seconds: 5)),
        // Retry on SocketException or TimeoutException
        retryIf: (e) => e is SocketException || e is TimeoutException,
      );
      //print(response.body);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        return jsonData["available"];
      } else {
        throw ServerException();
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  Future<List<Contact>> uploadContacts(
      List<ContactModel> contacts, Map<String, dynamic> headers) async {
    List<Map<String, dynamic>> jsonData = List<Map<String, dynamic>>.from(
        contacts.map((e) => e.toJson()).toList());
    final requestBody = json.encode(jsonData);
    final response = await client
        .post(Urls.UPLOAD_CONTACTS, body: requestBody, headers: headers)
        .timeout(Duration(minutes: 30));
    print("REQUEST COMPLETE");
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<ContactModel> results = [];
      final jsonResult = json.decode(response.body);
      for (var obj in jsonResult) {
        results.add(ContactModel.fromJson(obj));
      }
      return results;
    } else if (response.statusCode ~/ 100 == 4) {
      throw AuthenticationException();
    } else if (response.statusCode ~/ 100 == 5) {
      throw ServerException();
    }
  }
}
