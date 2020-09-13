import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/data/models/cop_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/data/models/user_model.dart';
import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:copdb/features/copdb/domain/entities/cop.dart';
import 'package:json_annotation/json_annotation.dart';

part 'complaint_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ComplaintModel extends Complaint implements Model {
  final CopModel cop;
  ComplaintModel({
    String abuseType,
    String allegation,
    this.cop,
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
          abuseType: abuseType,
          allegation: allegation,
          cop: cop,
          complainantName: complainantName,
          complainantGender: complainantGender,
          complainantEthnicity: complainantEthnicity,
          complainantAge: complainantAge,
          contactReason: contactReason,
          dateRecieved: dateRecieved,
          description: description,
          outcome: outcome,
          finding: finding,
        );
  factory ComplaintModel.fromJson(Map<String, dynamic> json) =>
      _$ComplaintModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComplaintModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CopDBComplaintModel extends CopDBComplaint {
  final CoordinatesModel location;
  final String image;
  final UserModel account;
  final CopModel cop;
  CopDBComplaintModel({
    this.location,
    this.image,
    this.account,
    String abuseType,
    String allegation,
    this.cop,
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
          location: location,
          image: image,
          account: account,
          abuseType: abuseType,
          allegation: allegation,
          cop: cop,
          complainantName: complainantName,
          complainantGender: complainantGender,
          complainantEthnicity: complainantEthnicity,
          complainantAge: complainantAge,
          contactReason: contactReason,
          dateRecieved: dateRecieved,
          description: description,
          outcome: outcome,
          finding: finding,
        );
    factory CopDBComplaintModel.fromJson(Map<String, dynamic> json) =>
      _$CopDBComplaintModelFromJson(json);
  Map<String, dynamic> toJson() => _$CopDBComplaintModelToJson(this);
}
