import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final int user;
  String displayName;
  String givenName;
  String middleName;
  String prefix;
  String suffix;
  String familyName;
  List<String> emails;
  List<String> phones;
  List<String> addresses;
  String company;
  String jobTitle;
  Contact({
    this.user,
    this.displayName,
    this.givenName,
    this.middleName,
    this.prefix,
    this.suffix,
    this.familyName,
    this.emails,
    this.phones,
    this.addresses,
    this.company,
    this.jobTitle,
  });
  @override
  List<Object> get props => [user];
}
