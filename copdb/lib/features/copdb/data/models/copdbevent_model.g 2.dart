// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'copdbevent_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CopDBEventModel _$CopDBEventModelFromJson(Map<String, dynamic> json) {
  return CopDBEventModel(
    complaint: json['complaint'] == null
        ? null
        : ComplaintModel.fromJson(json['complaint'] as Map<String, dynamic>),
    numSharers: json['num_sharers'] as int,
    numPromotions: json['num_promotions'] as int,
  );
}

Map<String, dynamic> _$CopDBEventModelToJson(CopDBEventModel instance) =>
    <String, dynamic>{
      'num_sharers': instance.numSharers,
      'num_promotions': instance.numPromotions,
      'complaint': instance.complaint?.toJson(),
    };
