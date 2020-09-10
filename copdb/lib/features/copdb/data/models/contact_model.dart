import 'package:contacts_service/contacts_service.dart' as service;
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/contact.dart';
import 'package:json_annotation/json_annotation.dart';


part 'contact_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ContactModel extends Contact implements Model {
  ContactModel({
    int user,
    String displayName,
    String givenName,
    String middleName,
    String prefix,
    String suffix,
    String familyName,
    List<int> avatar,
    List<Map<String, String>> addresses,
    List<Map<String, String>> emails,
    List<Map<String, String>> phones,
    String company,
    String jobTitle,
  }) : super(
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
  factory ContactModel.fromDeviceInfoPlugin(service.Contact contact, int user) {
    return ContactModel(
      user: user,
      displayName: contact.displayName,
      givenName: contact.givenName,
      middleName: contact.middleName,
      prefix: contact.prefix,
      avatar: contact.avatar,
      suffix: contact.suffix,
      phones: contact.phones
          .toList()
          .map((e) => <String, String>{"label": e.label, "value": e.value}),
      emails: contact.emails
          .toList()
          .map((e) => <String, String>{"label": e.label, "value": e.value}),
      familyName: contact.familyName,
      addresses: contact.postalAddresses.map((address) => {
            "label": address.label,
            "street": address.street,
            "city": address.city,
            "postcode": address.postcode,
            "region": address.region,
            "country": address.country
          }),
      company: contact.company,
      jobTitle: contact.jobTitle,
    );
  }
}
