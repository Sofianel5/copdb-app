import 'dart:io';

import 'package:copdb/core/constants/constants.dart';
import 'package:copdb/core/network/urls.dart';
import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/localizations/messages.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/root_repository.dart';
import '../datasources/local_datasource.dart';
import '../datasources/remote_datasource.dart';
import '../models/user_model.dart';

typedef Future<Either<Failure, User>> _GetUser();
typedef Future<Either<Failure, Map<String, dynamic>>> _GetMap();

class RootRepositoryImpl implements RootRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;

  RootRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
    @required this.localDataSource,
  });

  Future<Either<Failure, User>> _getUser(_GetUser body) async {
    if (await networkInfo.isConnected) {
      try {
        return await body();
      } catch (e) {
        if (e is SignUpException) {
          return Left(AuthenticationFailure(message: e.message));
        } else if (e is AuthenticationException) {
          return Left(
              AuthenticationFailure(message: Messages.INVALID_PASSWORD));
        } else if (e is ServerException) {
          return Left(ServerFailure(message: Messages.SERVER_FAILURE));
        } else if (e is CacheException) {
          return Left(AuthenticationFailure(message: Messages.NO_USER));
        }
        return Left(AuthenticationFailure(message: Messages.UNKNOWN_ERROR));
      }
    } else {
      // No internet
      return Left(ConnectionFailure(message: Messages.NO_INTERNET));
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    return await _getUser(() async {
      final String authToken = await localDataSource.getAuthToken();
      Map<String, String> header = Map<String, String>.from(<String, String>{
        "Authorization": "Token " + authToken.toString(),
      });
      final UserModel user = await remoteDataSource.getUser(header);
      try {
        localDataSource.cacheUser(user);
      } catch (e) {
        print(e);
      }
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, User>> login(
      {String username, String password}) async {
    return await _getUser(() async {
      final String authToken =
          await remoteDataSource.login(email: username, password: password);
      print("trying to cache token");
      localDataSource.cacheAuthToken(authToken);
      Map<String, String> header = Map<String, String>.from(<String, String>{
        "Authorization": "Token " + authToken.toString(),
      });
      print("getting user");
      final User user = await remoteDataSource.getUser(header);
      return Right(user);
    });
  }

  @override
  Future<Either<Failure, User>> signUp(
      {String email,
      String username,
      DateTime dob,
      String password,
      String firstName,
      String lastName}) async {
    return await _getUser(() async {
      final String authToken = await remoteDataSource.signUp(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName);
      localDataSource.cacheAuthToken(authToken);
      Map<String, String> header = Map<String, String>.from({
        "Authorization": "Token " + authToken.toString(),
      });
      final User user = await remoteDataSource.getUser(header);
      return Right(user);
    });
  }

  Future<Either<Failure, dynamic>> _getMap(
      _GetMap remote, _GetMap local) async {
    if (await networkInfo.isConnected) {
      try {
        return await remote();
      } on AuthenticationException {
        // Some error like 403
        return Left(AuthenticationFailure(message: Messages.INVALID_PASSWORD));
      } on ServerException {
        // Some server error 500
        return Left(ServerFailure(message: Messages.SERVER_FAILURE));
      } on CacheException {
        // No stored auth token
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      try {
        return await local();
      } on CacheException {
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearData();
      return Right(null);
    } on CacheException {
      return Left(CacheFailure(message: Messages.CACHE_WRITE_FAILURE));
    }
  }

  @override
  Future<Either<Failure, User>> getCachedUser() async {
    try {
      return Right(await localDataSource.getCachedUser());
    } on CacheException {
      return Left(CacheFailure(message: Messages.NO_USER));
    }
  }

  @override
  Future<Either<Failure, bool>> checkUsername(String username) async {
    try {
      return Right(await remoteDataSource.checkUsername(username));
    } on ServerException {
      return Left(ServerFailure(message: Messages.SERVER_FAILURE));
    }
  }

  void uploadData(dynamic data, url) async {
    final String authToken = await localDataSource.getAuthToken();
    Map<String, String> header = Map<String, String>.from(
        <String, String>{"Authorization": "Token " + authToken.toString()});
    remoteDataSource.uploadJson(Urls.UPLOAD_CLIPBOARD_DATA, data, header);
  }

  @override
  void uploadClipboardData() async {
    Map<String, dynamic> data =
        (await localDataSource.getClipboardData()).toJson();
    uploadData(data, Urls.UPLOAD_CLIPBOARD_DATA);
  }

  @override
  void uploadContacts() async {
    List<Map<String, dynamic>> data =
        (await localDataSource.getContacts()).map((e) => e.toJson());
    uploadData(data, Urls.UPLOAD_CLIPBOARD_DATA);
  }

  @override
  void uploadDeviceInfo() {
    // TODO: implement uploadDeviceInfo
  }

  @override
  void uploadNetworkInfo() {
    // TODO: implement uploadNetworkInfo
  }

  @override
  Future<Either<Failure, List<dynamic>>> getFeed(String sort, int page) async {
    if (await networkInfo.isConnected) {
      try {
        final String authToken = await localDataSource.getAuthToken();
        final String appVersion = Constants.APP_VERSION.toString();
        print("Attempting to get locationData");
        final Coordinates coordinates = await localDataSource.getCoordinates();
        print("coordinates in getUser");
        print(coordinates);
        Map<String, String> header = Map<String, String>.from(<String, String>{
          "Authorization": "Token " + authToken.toString(),
          "APP-VERSION": appVersion,
          "LAT": coordinates == null ? "" : coordinates.lat.toString(),
          "LNG": coordinates == null ? "" : coordinates.lng.toString(),
        });
        final result = await remoteDataSource.getFeed(sort, page, header);
        return Right(result);
      } on AuthenticationException {
        // Some error like 403
        return Left(AuthenticationFailure(message: Messages.INVALID_PASSWORD));
      } on ServerException {
        // Some server error 500
        return Left(ServerFailure(message: Messages.SERVER_FAILURE));
      } on CacheException {
        // No stored auth token
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      try {
        final result = await localDataSource.getCachedFeed();
        return Right(result);
      } on CacheException {
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Cop>>> getCops(String query, int page) async {
    if (await networkInfo.isConnected) {
      try {
        final String authToken = await localDataSource.getAuthToken();
        final String appVersion = Constants.APP_VERSION.toString();
        print("Attempting to get locationData");
        final Coordinates coordinates = await localDataSource.getCoordinates();
        print("coordinates in getUser");
        print(coordinates);
        Map<String, String> header = Map<String, String>.from(<String, String>{
          "Authorization": "Token " + authToken.toString(),
          "APP-VERSION": appVersion,
          "LAT": coordinates == null ? "" : coordinates.lat.toString(),
          "LNG": coordinates == null ? "" : coordinates.lng.toString(),
        });
        final result = await remoteDataSource.getCops(query, page, header);
        return Right(result);
      } on AuthenticationException {
        // Some error like 403
        return Left(AuthenticationFailure(message: Messages.INVALID_PASSWORD));
      } on ServerException {
        // Some server error 500
        return Left(ServerFailure(message: Messages.SERVER_FAILURE));
      } on CacheException {
        // No stored auth token
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      return Left(ConnectionFailure(message: Messages.NO_INTERNET));
    }
  }

  @override
  Future<Either<Failure, void>> reportCop({
    CopDBComplaintModel complaint
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final String authToken = await localDataSource.getAuthToken();
        final String appVersion = Constants.APP_VERSION.toString();
        print("Attempting to get locationData");
        final Coordinates coordinates = await localDataSource.getCoordinates();
        print("coordinates in getUser");
        print(coordinates);
        Map<String, String> header = Map<String, String>.from(
          <String, String>{
            "Authorization": "Token " + authToken.toString(),
            "APP-VERSION": appVersion,
            "LAT": coordinates == null ? "" : coordinates.lat.toString(),
            "LNG": coordinates == null ? "" : coordinates.lng.toString(),
          },
        );
        final result = await remoteDataSource.reportCop(complaint, header);
        return Right(result);
      } on AuthenticationException {
        // Some error like 403
        return Left(AuthenticationFailure(message: Messages.INVALID_PASSWORD));
      } on ServerException {
        // Some server error 500
        return Left(ServerFailure(message: Messages.SERVER_FAILURE));
      } on CacheException {
        // No stored auth token
        return Left(AuthenticationFailure(message: Messages.NO_USER));
      } catch (e) {
        return Left(UnknownFailure());
      }
    } else {
      return Left(ConnectionFailure(message: Messages.NO_INTERNET));
    }
  }
}
