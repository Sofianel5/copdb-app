import 'package:copdb/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class CheckEmail extends UseCase<bool, CheckEmailParams> {
  final RootRepository repository;
  CheckEmail(this.repository);

  @override 
  Future<Either<Failure, bool>> call(CheckEmailParams params) async {
    return await repository.checkEmail(params.email);
  }
}

class CheckEmailParams extends Params {
  final String email;
  CheckEmailParams({@required this.email});

  @override
  List<Object> get props => [email];
  
}