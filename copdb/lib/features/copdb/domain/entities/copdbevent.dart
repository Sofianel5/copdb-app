import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:equatable/equatable.dart';


class CopDBEvent extends Equatable {

  final CopDBComplaint complaint;

  final int numSharers;
  final String title;

  final int numPromotions;

  CopDBEvent({
    this.complaint,
    this.numPromotions,
    this.numSharers,
    this.title
  });

  @override
  List<Object> get props => [];
  
}