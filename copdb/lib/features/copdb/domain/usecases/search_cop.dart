import 'package:copdb/core/localizations/messages.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class GetCops extends UseCase<List<Cop>, GetCopsParams> {
  final RootRepository repository;
  GetCops(this.repository);

  @override 
  Future<Either<Failure, List<Cop>>> call(GetCopsParams params) async {
    if (params.query == null || params.query == "") {
      return Left(InvalidInputFailure(message: Messages.NO_QUERY));
    }

    return await repository.getCops(params.query, params.page);
  }
}

class GetCopsParams extends Params {

  final int page;
  final String query;
  GetCopsParams({this.query,this.page=1});

  @override
  List<Object> get props => [query, page];
  
}