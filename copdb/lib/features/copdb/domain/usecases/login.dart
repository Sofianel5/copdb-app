import 'package:copdb/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class Login extends UseCase<User, LoginParams> {
  final RootRepository repository;
  Login(this.repository);

  @override 
  Future<Either<Failure, User>> call(LoginParams params) async {
    final inputValidator = InputConverter();
    final invalidInputs = inputValidator.validateLoginForm(params.username, params.password);
    if (invalidInputs.length != 0) {
      InvalidFormFailure val = await Future.delayed(Duration(seconds: 0), () => InvalidFormFailure(messages: invalidInputs));
      return Left(val);
    } else {
      final userOrFailure = await repository.login(username: params.username, password: params.password);
      return userOrFailure;
    }
  }
}

class LoginParams extends Params {
  final String username;
  final String password;
  LoginParams({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
  
}