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
  bool added;
  bool invited;
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
    this.added=false,
    this.invited=false,
  });
  @override
  List<Object> get props => [user, givenName, middleName, prefix, suffix, familyName, phones, emails, avatar, avatarBase64, addresses, referencedUser, areFriends];

  String getPrimaryContactInfo() {
    if (this.phones != null && this.phones.length > 0 && this.phones[0]["value"] != null) {
      return this.phones[0]["value"];
    }
    else if (this.emails != null && this.emails.length > 0 && this.emails[0]["value"] != null) {
      return this.emails[0]["value"];
    }
    return null;
  }

  String primaryContactType() {
    if (this.phones != null && this.phones.length > 0 && this.phones[0]["value"] != null) {
      return "phone";
    }
    else if (this.emails != null && this.emails.length > 0 && this.emails[0]["value"] != null) {
      return "email";
    }
    return null;
  }
}
