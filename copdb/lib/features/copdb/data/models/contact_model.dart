import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/contact.dart';
import 'model.dart';

part 'contact_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ContactModel extends Contact implements Model {
  String emailsRaw;
  String phonesRaw;
  String addressesRaw;
  ContactModel({
    int user,
    String displayName,
    String givenName,
    String middleName,
    String prefix,
    String suffix,
    String familyName,
    List<String> emails,
    List<String> phones,
    List<String> addresses,
    String company,
    String jobTitle,
    this.addressesRaw,
    this.emailsRaw,
    this.phonesRaw
  }) : super ( 
    user: user,
    displayName: displayName,
    givenName: givenName,
    middleName: middleName,
    prefix: prefix,
    suffix: suffix,
    familyName: familyName,
    emails: emails,
    phones: phones,
    addresses: addresses,
    company: company,
    jobTitle: jobTitle,
  );
  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
}