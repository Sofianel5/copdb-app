import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class GetFeed extends UseCase<List<dynamic>, GetFeedParams> {
  final RootRepository repository;
  GetFeed(this.repository);

  @override 
  Future<Either<Failure, List<dynamic>>> call(GetFeedParams params) async {
    return await repository.getFeed(params.sort, params.page);
  }
}

class GetFeedParams extends Params {
  final int page;
  final String sort;
  GetFeedParams({this.page=1, this.sort="time"});

  @override
  List<Object> get props => [sort, page];
  
}