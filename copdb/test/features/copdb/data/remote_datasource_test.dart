import 'dart:convert';

import 'package:copdb/core/errors/exceptions.dart';
import 'package:copdb/features/copdb/data/datasources/remote_datasource.dart';
import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';

import '../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  RemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = RemoteDataSourceImpl(client: mockHttpClient);
  });
  Map<String, dynamic> userJson = json.decode(fixture("user_internal.json"));
  UserModel tUserModel = UserModel.fromJson(userJson);
  User user = tUserModel;
  final String password = "214596983";
  final String email = "slarbi10@stuy.edy";
  final String realToken = "5c83dc215a855ef7640fc7b5410385051b8fe985";
  final DateTime dob = DateTime.parse("2002-11-10T00:00:00-05:00");
  final String first_name = "Sofiane";
  final String username = "realsofianelarbi";
  final String last_name = "Larbi";

  group(("login"), () {
    test("should send a post request to correct URL", () async {
      // arrange
      when(mockHttpClient.post("https://api.copdb.app/users/auth/token/login/",
              headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response(
              """{"auth_token": "5c83dc215a855ef7640fc7b5410385051b8fe985"}""",
              200));
      // act
      dataSource.login(email: email, password: password);
      // assert
      verify(mockHttpClient.post(
          "https://api.copdb.app/users/auth/token/login/",
          body: anyNamed("body")));
    });

    test("should return valid token when the response code is 200", () async {
      // arrange
      when(mockHttpClient.post("https://api.copdb.app/users/auth/token/login/",
              headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response(
              """{"auth_token": "5c83dc215a855ef7640fc7b5410385051b8fe985"}""",
              200));
      // act
      final result = await dataSource.login(email: email, password: password);
      // assert
      expect(result, realToken);
    });

    test("should throw ServerException when the response code is 500",
        () async {
      // arrange
      when(mockHttpClient.post("https://api.copdb.app/users/auth/token/login/",
              headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response("""""", 500));
      // act
      final call = dataSource.login;
      // assert
      expect(() => call(email: email, password: password),
          throwsA(TypeMatcher<ServerException>()));
    });

    test("should throw AuthenticationException when the response code is 400",
        () async {
      // arrange
      when(mockHttpClient.post("https://api.copdb.app/users/auth/token/login/",
              headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer((_) async => http.Response("""""", 400));
      // act
      final call = dataSource.login;
      // assert
      expect(() => call(email: email, password: password),
          throwsA(TypeMatcher<AuthenticationException>()));
    });
  });
  group("signup", () {
    test("should send a post request to correct URL", () async {
      // arrange
      when(
        mockHttpClient.post(
          "https://api.copdb.app/users/auth/users/",
          headers: anyNamed("headers"),
          body: anyNamed("body"),
        ),
      ).thenAnswer(
        (_) async => http.Response(json.encode(userJson),
          201,
        ),
      );
      // act
      dataSource.signUp(
        email: email,
        password: password,
        firstName: first_name,
        lastName: last_name,
        dob: dob,
        username: username,
      );
      // assert
      verify(
        mockHttpClient.post(
          "https://api.copdb.app/users/auth/users/",
          body: anyNamed("body"),
        ),
      );
    });

    test("should return valid token when the response code is 200", () async {
      // arrange
      when(mockHttpClient.post("https://api.copdb.app/users/auth/users/",
              headers: anyNamed("headers"), body: anyNamed("body")))
          .thenAnswer(
        (_) async => http.Response(json.encode(userJson),
          201,
        ),
      );
      // act
      final result = await dataSource.signUp(
        email: email,
        password: password,
        firstName: first_name,
        lastName: last_name,
        dob: dob,
        username: username,
      );
      // assert
      expect(result, json.encode(userJson));
    });
  });
}
