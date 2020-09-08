import 'package:equatable/equatable.dart';

class ClipboardData extends Equatable {
  final int user;
  final DateTime timestamp;
  final String data;
  ClipboardData({
    this.user,
    this.timestamp,
    this.data
  });
  @override
  List<Object> get props => [user, timestamp, data];
}