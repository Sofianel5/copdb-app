import 'package:copdb/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class UploadDeviceInfo extends UseCase<void, NoParams> {
  final RootRepository repository;
  UploadDeviceInfo(this.repository);
  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    repository.uploadDeviceInfo();
  }
}
