import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class GetLocalContacts extends UseCase<List<Contact>, NoParams> {
  final RootRepository repository;
  GetLocalContacts(this.repository);
  @override
  Future<Either<Failure, List<Contact>>> call(NoParams params) async {
    return await repository.getLocalContacts();
  }
}
