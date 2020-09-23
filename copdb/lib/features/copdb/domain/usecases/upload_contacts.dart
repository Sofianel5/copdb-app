import 'package:copdb/core/util/input_converter.dart';
import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class UploadContacts extends UseCase<List<Contact>, NoParams> {
  final RootRepository repository;
  UploadContacts(this.repository);
  @override
  Future<Either<Failure, List<Contact>>> call(NoParams params) async {
    return await repository.uploadContacts();
  }
}
