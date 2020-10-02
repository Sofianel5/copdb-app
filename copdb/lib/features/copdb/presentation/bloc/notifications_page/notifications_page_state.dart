part of '../root_bloc.dart';

class NotificationsState extends AuthenticatedState {
  NotificationsState(User user) : super(user);
  List<Object> get props => [user];
} 

class NotificationsLoadingState extends NotificationsState {
  NotificationsLoadingState(User user) : super(user);
}

// Cannnot display Notifications
class FailedNotificationsState extends NotificationsState {
  String message;
  FailedNotificationsState(User user, this.message) : super(user);
  List<Object> get props => [user, message];
}

// Notifications displayed
class LoadedNotificationsState extends NotificationsState {
  List<Notification> notifications;
  LoadedNotificationsState(User user, this.notifications) : super(user);
  List<Object> get props => [user, notifications];
}