import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class UploadLocationPing extends UseCase<void, UploadLocationPingParams> {
  final RootRepository repository;
  UploadLocationPing(this.repository);
  @override
  Future<Either<Failure, void>> call(UploadLocationPingParams params) async {
    repository.uploadLocationPing(params.location);
  }
}

class UploadLocationPingParams extends Params {
  final CoordinatesModel location;
  UploadLocationPingParams(this.location);
}