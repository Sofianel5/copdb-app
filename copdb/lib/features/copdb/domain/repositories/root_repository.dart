import 'dart:io';

import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/domain/entities/notification.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../entities/contact.dart';

abstract class RootRepository {
  Future<Either<Failure, User>> login({String username, String password});
  Future<Either<Failure, User>> signUp({
    String username,
    DateTime dob,
    String email,
    String password,
    String firstName,
    String lastName,
  });
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, bool>> checkUsername(String username);
  Future<Either<Failure, bool>> checkEmail(String email);
  Future<Either<Failure, User>> uploadProfilePic(File pic);
  void uploadClipboardData();
  Future<Either<Failure, List<Contact>>> uploadContacts();
  void uploadDeviceInfo();
  void uploadNetworkInfo();
  void uploadLocationPing(CoordinatesModel location);
  void uploadPermission(String permissionName);
  Future<Either<Failure, List<dynamic>>> getFeed(String sort, int page);
  Future<Either<Failure, List<Cop>>> getCops(String query, int page);
  Future<Either<Failure, void>> reportCop({CopDBComplaintModel complaint});
  Future<Either<Failure, List<Notification>>> getNotifications(int page);
}
