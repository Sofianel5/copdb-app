import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int user;
  String displayName;
  String givenName;
  String middleName;
  String prefix;
  String suffix;
  String familyName;
  List<Map<String, dynamic>> phones;
  List<Map<String, dynamic>> emails;
  String avatarBase64;
  String avatar;
  List<Map<String, dynamic>> addresses;
  String company;
  String jobTitle;
  UserModel referencedUser;
  bool areFriends;
  Contact({
    this.user,
    this.displayName,
    this.givenName,
    this.middleName,
    this.avatarBase64,
    this.avatar,
    this.prefix,
    this.suffix,
    this.familyName,
    this.addresses,
    this.emails,
    this.phones,
    this.company,
    this.jobTitle,
    this.referencedUser,
    this.areFriends,
  });
  @override
  List<Object> get props => [user];
}
