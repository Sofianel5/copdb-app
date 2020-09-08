import 'package:contacts_service/contacts_service.dart' as service;
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/contact.dart';
import 'model.dart';

part 'contact_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ItemModel extends Item implements Model {
  ItemModel({this.label, this.value});
  String label, value;
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}

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
    List<int> avatar,
    List<ItemModel> emails,
    List<ItemModel> phones,
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
    avatar: avatar,
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
  factory ContactModel.fromDeviceInfoPlugin (service.Contact contact, int user) {
    return ContactModel(
      user: user, 
      displayName: contact.displayName,
      givenName: contact.givenName,
      middleName: contact.middleName,
      prefix: contact.prefix,
      avatar: contact.avatar,
      suffix: contact.suffix,
      phones: contact.phones.toList().map((e) => Item(label: e.label, value: e.value)),
      emails: contact.emails.toList().map((e) => Item(label: e.label, value: e.value)),
      familyName: contact.familyName,
      addresses: contact.postalAddresses.map((e) => e.toString()),
      company: contact.company,
      jobTitle: contact.jobTitle,
    );
  }
}