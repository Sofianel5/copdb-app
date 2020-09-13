import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Notification extends Equatable {

  final DateTime sentAt;
  final String title;
  final String body;
  final Map<String, dynamic> data;

  Notification({@required this.sentAt, @required this.body, @required this.title, this.data});

  @override
  List<Object> get props => [sentAt, title, body];
}