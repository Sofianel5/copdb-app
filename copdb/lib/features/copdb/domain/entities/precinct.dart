import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:copdb/features/copdb/domain/entities/police_department.dart';
import 'package:equatable/equatable.dart';


class Precinct extends Equatable {
  final String name;
  final String image;
  final PoliceDepartment policeDepartment;
  final bool isHq;
  final Coordinates coordinates;
  final Address address;
  Precinct({
    this.name,
    this.image,
    this.policeDepartment,
    this.isHq,
    this.coordinates,
    this.address
  });
  @override
  List<Object> get props => [name, image, policeDepartment];
}