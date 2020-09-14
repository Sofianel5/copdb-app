import 'package:copdb/features/copdb/domain/entities/complaint.dart';
import 'package:equatable/equatable.dart';


class CopDBEvent extends Equatable {

  final Complaint complaint;

  final int numSharers;

  final int numPromotions;

  CopDBEvent({
    this.complaint,
    this.numPromotions,
    this.numSharers
  });

  @override
  List<Object> get props => [];
  
}