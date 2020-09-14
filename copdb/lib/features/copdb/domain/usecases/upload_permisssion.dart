import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class UploadPermission extends UseCase<void, UploadPermissionParams> {
  final RootRepository repository;
  UploadPermission(this.repository);

  @override 
  Future<Either<Failure, void>> call(UploadPermissionParams params) async {
    repository.uploadPermission(params.permissionName);
  }
}

class UploadPermissionParams extends Params {
  final String permissionName;
  UploadPermissionParams({@required this.permissionName});

  @override
  List<Object> get props => [permissionName];
  
}