import 'package:copdb/features/copdb/data/models/complaint_model.dart';
import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/copdbevent.dart';
import 'package:json_annotation/json_annotation.dart';

part 'copdbevent_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CopDBEventModel extends CopDBEvent implements Model {
  final ComplaintModel complaint;
  CopDBEventModel({
    this.complaint,

  final int numSharers,

  final int numPromotions,
  }) : super(
    complaint: complaint,
    numSharers: numSharers,
    numPromotions: numPromotions
  );
  factory CopDBEventModel.fromJson(Map<String, dynamic> json) =>
      _$CopDBEventModelFromJson(json);
  Map<String, dynamic> toJson() => _$CopDBEventModelToJson(this);
}
