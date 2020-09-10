import 'package:copdb/features/copdb/domain/usecases/upload_device_info.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class RootRepository {
  Future<Either<Failure, User>> login({String username, String password});
  Future<Either<Failure, User>> signUp({String username, DateTime dob, String email, String password, String firstName, String lastName});
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCachedUser();
  Future<Either<Failure, bool>> checkUsername(String username);
  void uploadClipboardData();
  void uploadContacts();
  void uploadDeviceInfo();
  void uploadNetworkInfo();
  Future<Either<Failure, List<dynamic>>> getFeed(String sort);
}