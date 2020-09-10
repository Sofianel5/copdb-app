import 'package:equatable/equatable.dart';

import 'complaint.dart';

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