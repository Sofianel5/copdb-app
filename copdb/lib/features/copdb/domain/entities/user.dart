import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable{
  final int id;
  final String email;
  final String firstName;
  final String username;
  final String lastName;

  User({
    @required this.id,  
    @required this.username,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
  });

  @override
  List<Object> get props => [id];

  @override 
  String toString() {
    return this.firstName + " " + this.lastName;
  }

}