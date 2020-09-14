import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable{
  final int id;
  final String email;
  final String firstName;
  final String username;
  final String lastName;
  final String profilePic;
  final DateTime dob;
  final DateTime dateJoined;
  final bool verified;
  final List<User> friends;
  final List<User> following;
  final List<User> followers;

  User({
    @required this.id,  
    @required this.username,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
    @required this.verified,
    @required this.profilePic,
    @required this.dob,
    @required this.dateJoined,
    this.friends,
    this.following,
    this.followers,
  });

  @override
  List<Object> get props => [id];

  @override 
  String toString() {
    return this.firstName + " " + this.lastName;
  }

}