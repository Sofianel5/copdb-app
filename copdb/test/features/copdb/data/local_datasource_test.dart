import 'dart:convert';

import 'package:copdb/core/errors/exceptions.dart';
import 'package:copdb/features/copdb/data/datasources/local_datasource.dart';
import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:matcher/matcher.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  LocalDataSourceImpl localDataSource;
  MockSharedPreferences mockSharedPreferences;
  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = LocalDataSourceImpl(mockSharedPreferences);
  });
  final String authToken = "HI :)";
  final String authTokenKey = "authtoken";
  final Map<String, dynamic> userJson = <String, dynamic>{
    "username": "realsofianelarbi",
    "email": "sofiane@tracery.us",
    "first_name": "Sofiane",
    "last_name": "Larbi",
    "dob": "2002-11-10T00:00:00-05:00",
    "profile_pic": "bruh",
    "date_joined": "2002-11-10T00:00:00-05:00"
  };
  final UserModel userModel = UserModel.fromJson(userJson);
  group('getAuthToken', () {
    test("should return auth token when it is stored", () async {
      // arrange
      when(mockSharedPreferences.getString(AUTH_TOKEN_KEY))
          .thenReturn(authToken);
      // act
      final result = await localDataSource.getAuthToken();
      // assert
      verify(mockSharedPreferences.getString(AUTH_TOKEN_KEY));
      expect(result, authToken);
    });
    test("should return CacheException when it is not stored", () async {
      // arrange
      when(mockSharedPreferences.getString(AUTH_TOKEN_KEY)).thenReturn(null);
      final call = localDataSource.getAuthToken;
      // act
      // assert
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
      verify(mockSharedPreferences.getString(authTokenKey));
    });
  });

  group("cacheAuthToken", () {
    test("should call SharedPreferences to cache the data", () async {
      // arrange
      // act
      localDataSource.cacheAuthToken(authToken);
      // assert
      verify(mockSharedPreferences.setString(AUTH_TOKEN_KEY, authToken));
    });
  });

  group("clearData", () {
    test("clearData clears all data", () async {
      // arrange
      when(mockSharedPreferences.clear())
          .thenAnswer((_)  async => true);
      // act
      localDataSource.clearData();
      // assert
      verify(mockSharedPreferences.clear());
    });
  });

  group("cacheUser", () {
    test("cacheUser sends serialized model to shared_preferences", () async {
      // arrange
      final jsonString = json.encode(userJson);
      when(mockSharedPreferences.setString(USER_KEY, jsonString))
          .thenAnswer((_)  async => true);
      // act
      localDataSource.cacheUser(userModel);
      // assert
      verify(mockSharedPreferences.setString("user", """{"id":null,"email":"sofiane@tracery.us","first_name":"Sofiane","username":"realsofianelarbi","last_name":"Larbi","profile_pic":"bruh","dob":"2002-11-10T05:00:00.000Z","date_joined":"2002-11-10T05:00:00.000Z","verified":null}"""));
    });
  });

  group("getCachedUser", () {
    test("getCachedUser returns serialized model from shared_preferences", () async {
      // arrange
      when(mockSharedPreferences.getString(USER_KEY))
          .thenReturn(json.encode(userJson));
      // act
      final res = await localDataSource.getCachedUser();
      // assert
      verify(mockSharedPreferences.getString(USER_KEY));
      assert(res == userModel);
      assert(res.email == "sofiane@tracery.us");
      assert(res.username == "realsofianelarbi");
      assert(res.dob == DateTime.parse("2002-11-10T00:00:00-05:00"));
      assert(res.dateJoined == DateTime.parse("2002-11-10T00:00:00-05:00"));
      assert(res.firstName == "Sofiane");
      assert(res.lastName == "Larbi");
      assert(res.profilePic == "bruh");
    });
  });
}
