import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class AddressModel extends Address implements Model {
  AddressModel({
    String address_1,
    String address_2,
    String postCode,
    String city,
    String state,
    int id,
  }) : super(
    address_1: address_1,
    address_2: address_2,
    postCode: postCode,
    city: city,
    state: state,
    id: id,
  );
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
