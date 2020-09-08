import 'dart:convert';

import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/urls.dart';
import '../models/user_model.dart';

abstract class RemoteDataSource {
  Future<String> login({String email, String password});
  Future<String> signUp(
      {String email, String password, String firstName, String lastName});
  Future<UserModel> getUser(Map<String, dynamic> headers);
  Future<bool> checkUsername(String username);
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

  Future<http.Response> _getResponse(Map<String, dynamic> data, String url,
      {Map<String, dynamic> headers, bool getMethod = false}) async {
    try {
      //print("going to post: ");
      http.Response response;
      //print(data);
      //print("headers: ");
      //print(headers);
      if (getMethod) {
        String urlParams = urlEncodeMap(data);
        response = await client.get(url + "?" + urlParams,
            headers: headers ?? <String, String>{});
      } else {
        response = await client.post(url,
            body: data, headers: headers ?? <String, String>{});
      }
      //print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response;
      } else if (response.statusCode ~/ 100 == 4) {
        throw AuthenticationException();
      } else if (response.statusCode ~/ 100 == 5) {
        throw ServerException();
      }
    } catch (e) {
      throw e;
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
  Future<String> login({String email, String password}) async {
    try {
      Map<String, String> data = <String, String>{
        "username": email,
        "password": password,
      };
      var jsonData;
      var response = await client.post(Urls.LOGIN_URL, body: data);
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
  Future<String> signUp(
      {String email,
      String username,
      DateTime dob,
      String password,
      String firstName,
      String lastName}) async {
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
      http.Response response = await client.post(Urls.SIGNUP_URL, body: data);
      //print(response.body);
      Map<String, dynamic> responseJsonData =
          Map<String, dynamic>.from(json.decode(response.body));
      if (response.statusCode == 201) {
        String token = await login(
            email: responseJsonData["email"], password: data['password']);
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
      var response =
          await client.get(Urls.CHECK_USERNAME + "?username=" + username);
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
}
