import 'package:equatable/equatable.dart';

import 'address.dart';
import 'coordinates.dart';

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