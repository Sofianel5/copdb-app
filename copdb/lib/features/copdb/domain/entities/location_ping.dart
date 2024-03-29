import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


class LocationPing extends Equatable {
  static const TYPES = <String>["iOS", "Android"];
  final DateTime timestamp;
  final Coordinates coordinates;
  final int user;
  LocationPing({@required this.timestamp, @required this.coordinates, @required this.user});

  @override
  List<Object> get props => [timestamp];
}