import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int user;
  String displayName;
  String givenName;
  String middleName;
  String prefix;
  String suffix;
  String familyName;
  List<Map<String, String>> phones;
  List<Map<String, String>> emails;
  List<int> avatar;
  List<String> addresses;
  String company;
  String jobTitle;
  Contact({
    this.user,
    this.displayName,
    this.givenName,
    this.middleName,
    this.avatar,
    this.prefix,
    this.suffix,
    this.familyName,
    this.addresses,
    this.emails,
    this.phones,
    this.company,
    this.jobTitle,
  });
  @override
  List<Object> get props => [user];
}
