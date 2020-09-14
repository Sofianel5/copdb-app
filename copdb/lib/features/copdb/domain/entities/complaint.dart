import 'package:copdb/features/copdb/domain/entities/address.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:equatable/equatable.dart';


class Complaint extends Equatable {
  final String abuseType;
  final String allegation;
  final Cop cop;
  final String complainantName;
  final String complainantGender;
  final String complainantEthnicity;
  final String complainantAge;
  final String contactReason;
  final DateTime dateRecieved;
  final String description;
  final String outcome;
  final String finding;
  final DateTime dateConcluded;
  Complaint({
    this.abuseType,
    this.allegation,
    this.cop,
    this.complainantName,
    this.complainantGender,
    this.complainantEthnicity,
    this.complainantAge,
    this.contactReason,
    this.dateRecieved,
    this.description,
    this.outcome,
    this.finding,
    this.dateConcluded,
  });
  @override
  List<Object> get props => [
        cop,
        abuseType,
        allegation,
        complainantName,
        complainantGender,
        complainantEthnicity,
        complainantAge,
        contactReason,
        description,
        outcome,
        finding,
        dateConcluded
      ];
}

class CopDBComplaint extends Complaint {
  final Coordinates location;
  final Address address;
  final String image;
  final User account;
  CopDBComplaint({
    this.location,
    this.image,
    this.address,
    this.account,
    String abuseType,
    String allegation,
    Cop cop,
    String complainantName,
    String complainantGender,
    String complainantEthnicity,
    String complainantAge,
    String contactReason,
    DateTime dateRecieved,
    String description,
    String outcome,
    String finding,
  }) : super(
    abuseType : abuseType,
    allegation : allegation,
    cop : cop,
    complainantName : complainantName,
    complainantGender : complainantGender,
    complainantEthnicity : complainantEthnicity,
    complainantAge : complainantAge,
    contactReason : contactReason,
    dateRecieved : dateRecieved,  
    description : description,
    outcome : outcome,
    finding : finding,
  );
}
