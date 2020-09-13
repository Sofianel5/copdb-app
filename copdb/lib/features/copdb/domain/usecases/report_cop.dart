import 'dart:convert';
import 'dart:io';

import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/data/models/coordinates_model.dart';
import 'package:copdb/features/copdb/data/models/cop_model.dart';
import 'package:copdb/features/copdb/domain/entities/coordinates.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user.dart';
import '../repositories/root_repository.dart';

class ReportCop extends UseCase<User, ReportCopParams> {
  final RootRepository repository;
  ReportCop(this.repository);
  @override
  Future<Either<Failure, User>> call(ReportCopParams params) async {
    final complaint =  CopDBComplaintModel(
      cop: CopModel( 
        firstName: params.firstName,
        lastName: params.lastName,
        badgeNumber: params.badgeNumber,
        sex: params.copSex,
        ethnicity: params.copEthnicity,
        description: params.copDescription,
        image: base64Encode(params.copImage.readAsBytesSync()),
      ),
      image: base64Encode(params.copImage.readAsBytesSync()),
      location: params.location,
      abuseType: params.abuseType,
      allegation: params.allegation,
      complainantGender: params.complainantGender,
      complainantEthnicity: params.complainantEthnicity,
      contactReason: params.contactReason,
      description: params.eventDescription,
      dateRecieved: DateTime.now()
    );
    return await repository.reportCop(
      complaint: complaint
    );
  }
}

class ReportCopParams extends Params {
  final String firstName;
  final String lastName;
  final String badgeNumber;
  final String copSex;
  final String copEthnicity;
  final String copDescription;
  final File copImage;
  final String abuseType;
  final String allegation;
  final String complainantGender;
  final CoordinatesModel location;
  final String complainantEthnicity;
  final String contactReason;
  final String eventDescription;

  ReportCopParams({
    this.firstName,
    this.lastName,
    this.badgeNumber,
    this.location,
    this.copSex,
    this.copEthnicity,
    this.copDescription,
    this.copImage,
    this.abuseType,
    this.allegation,
    this.complainantGender,
    this.complainantEthnicity,
    this.contactReason,
    this.eventDescription,
  });

  @override
  List<Object> get props => [
        firstName,
        lastName,
        badgeNumber,
        copSex,
        copEthnicity,
        copDescription,
        copImage,
        abuseType,
        allegation,
        complainantGender,
        complainantEthnicity,
        contactReason,
        eventDescription
      ];
}
