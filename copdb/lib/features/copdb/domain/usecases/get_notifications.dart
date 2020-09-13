import 'package:copdb/features/copdb/domain/entities/notification.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/root_repository.dart';

class GetNotifications extends UseCase<List<Notification>, GetNotificationsParams> {
  final RootRepository repository;
  GetNotifications(this.repository);

  @override 
  Future<Either<Failure, List<Notification>>> call(GetNotificationsParams params) async {
    return await repository.getNotifications(params.page);
  }
}

class GetNotificationsParams extends Params {
  final int page;
  GetNotificationsParams({this.page=1});
  @override
  List<Object> get props => [ page];
  
}
