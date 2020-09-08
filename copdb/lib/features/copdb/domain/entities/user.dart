import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable{
  final int id;
  final String email;
  final String firstName;
  final String username;
  final String lastName;
  final String profilePic;
  final bool verified;

  User({
    @required this.id,  
    @required this.username,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.verified,
    @required this.profilePic,
  });

  @override
  List<Object> get props => [id];

  @override 
  String toString() {
    return this.firstName + " " + this.lastName;
  }

}