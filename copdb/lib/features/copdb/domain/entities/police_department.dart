import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'copdbcity.dart';

class PoliceDepartment extends Equatable {
  final String name;
  final String image;
  final CopDBCity city;
  PoliceDepartment({
    this.name,
    this.image,
    this.city,
  });
  @override
  List<Object> get props => [name, image, city];
}