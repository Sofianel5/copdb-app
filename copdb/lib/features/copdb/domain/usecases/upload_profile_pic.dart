import 'dart:io';

import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class UploadProfilePic extends UseCase<User, UploadProfilePicParams> {
  final RootRepository repository;
  UploadProfilePic(this.repository);

  @override 
  Future<Either<Failure, User>> call(UploadProfilePicParams params) async {
    return await repository.uploadProfilePic(params.pic);
  }
}

class UploadProfilePicParams extends Params {
  final File pic;
  UploadProfilePicParams({@required this.pic});
  @override
  List<Object> get props => [pic];
}