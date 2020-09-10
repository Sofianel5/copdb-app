import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String address_1;
  final String address_2;
  final String postCode;
  final String city;
  final String state;
  final int id;
  Address({
    this.address_1,
    this.id,
    this.address_2,
    this.postCode,
    this.city,
    this.state,
  });
  @override
  List<Object> get props => [address_1, address_2, postCode, city, state, id];
}