import 'package:copdb/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class CheckUsername extends UseCase<bool, CheckUsernameParams> {
  final RootRepository repository;
  CheckUsername(this.repository);

  @override 
  Future<Either<Failure, bool>> call(CheckUsernameParams params) async {
    return await repository.checkUsername(params.username);
  }
}

class CheckUsernameParams extends Params {
  final String username;
  CheckUsernameParams({@required this.username});

  @override
  List<Object> get props => [username];
  
}