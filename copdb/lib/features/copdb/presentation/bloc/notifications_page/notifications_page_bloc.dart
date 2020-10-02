part of '../root_bloc.dart';

class NotificationsPageBloc
    extends Bloc<NotificationsEvent, NotificationsState> {
  final User user;
  final GetNotifications getNotifications;
  List<Contact> contacts;
  NotificationsPageBloc(
      {@required this.user, @required this.getNotifications}) {
    this.add(NotificationsPageOpenedEvent());
  }

  @override
  NotificationsState get initialState => NotificationsLoadingState(user);

  @override
  Stream<NotificationsState> mapEventToState(NotificationsEvent event) async* {
    print(event);
    if (event is NotificationsPageOpenedEvent) {
      final result = await getNotifications(GetNotificationsParams());
      yield* result.fold(
        (failure) async* {
          yield FailedNotificationsState(user, failure.message);
        },
        (success) async* {
          yield LoadedNotificationsState(user, success);
        },
      );
    }
  }
}
