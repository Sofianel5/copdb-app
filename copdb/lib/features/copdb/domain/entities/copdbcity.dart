import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:equatable/equatable.dart';


class CopDBCity extends Equatable {
  final String name;
  final Address hq;
  final Coordinates epicenter;
  CopDBCity({
    this.name,
    this.hq,
    this.epicenter,
  });
  @override
  List<Object> get props => [name, hq, epicenter];
}