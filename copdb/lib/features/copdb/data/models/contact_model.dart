import 'package:contacts_service/contacts_service.dart' as service;
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'dart:io';

part 'contact_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ContactModel extends Contact implements Model {
  ContactModel({
    int user,
    String displayName,
    String givenName,
    String middleName,
    String avatar,
    String prefix,
    String suffix,
    String familyName,
    String avatarBase64,
    List<Map<String, dynamic>> addresses,
    List<Map<String, dynamic>> emails,
    List<Map<String, dynamic>> phones,
    String company,
    String jobTitle,
    UserModel referencedUser,
    bool areFriends
  }) : super(
          user: user,
          displayName: displayName,
          givenName: givenName,
          avatar: avatar,
          middleName: middleName,
          prefix: prefix,
          avatarBase64: avatarBase64,
          suffix: suffix,
          familyName: familyName,
          emails: emails,
          phones: phones,
          addresses: addresses,
          company: company,
          jobTitle: jobTitle,
          areFriends: areFriends,
          referencedUser: referencedUser
        );
  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
  Map<String, dynamic> toJson() => _$ContactModelToJson(this);
  factory ContactModel.fromDeviceInfoPlugin(service.Contact contact, int user) {
    return ContactModel(
      user: user,
      displayName: contact.displayName,
      givenName: contact.givenName,
      middleName: contact.middleName,
      prefix: contact.prefix,
      avatarBase64: contact.avatar == null ? null : base64Encode(contact.avatar),
      suffix: contact.suffix,
      phones: contact.phones
          .toList()
          .map((e) => <String, String>{"label": e.label, "value": e.value}).toList(),
      emails: contact.emails
          .toList()
          .map((e) => <String, String>{"label": e.label, "value": e.value}).toList(),
      familyName: contact.familyName,
      addresses: contact.postalAddresses.toList().map((address) => {
            "label": address.label,
            "street": address.street,
            "city": address.city,
            "postcode": address.postcode,
            "region": address.region,
            "country": address.country
          }).toList(),
      company: contact.company,
      jobTitle: contact.jobTitle,
    );
  }
}
