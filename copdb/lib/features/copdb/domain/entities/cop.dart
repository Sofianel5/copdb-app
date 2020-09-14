import 'package:copdb/features/copdb/domain/entities/precinct.dart';
import 'package:equatable/equatable.dart';


class Cop extends Equatable {
  final String firstName;
  final String lastName;
  final String sex;
  final String ethnicity;
  final int age;
  final String rank;
  final String badgeNumber;
  final Precinct precinct;
  final String description;
  final String image;
  Cop({
    this.firstName,
    this.lastName,
    this.sex,
    this.ethnicity,
    this.age,
    this.rank,
    this.badgeNumber,
    this.precinct,
    this.description,
    this.image
  });
  @override
  List<Object> get props => [firstName, lastName, badgeNumber];
}