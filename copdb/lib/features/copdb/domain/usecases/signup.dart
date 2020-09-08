import 'package:copdb/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class Signup extends UseCase<User, SignupParams> {
  final RootRepository repository;
  Signup(this.repository);
  @override
  Future<Either<Failure, User>> call(SignupParams params) async {
    return await InputConverter().parsePassword(params.password).fold(
        (failure) {
      return Left(failure);
    }, (password) async {
      return await repository.signUp(
        username: params.username,
        email: params.email,
        dob: params.dob,
        password: params.password,
        firstName: params.firstName,
        lastName: params.lastName,
      );
    });
  }
}

class SignupParams extends Params {
  final String email;
  final String username;
  final DateTime dob;
  final String password;
  final String firstName;
  final String lastName;
  SignupParams(
      {@required this.username,
      @required this.email,
      @required this.password,
      @required this.firstName,
      @required this.lastName,
      @required this.dob});

  @override
  List<Object> get props => [email, password];
}
