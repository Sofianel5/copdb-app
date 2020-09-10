import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/clipboard_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clipboard_data_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ClipboardDataModel extends ClipboardData implements Model {
  ClipboardDataModel({
    String data,
    DateTime timestamp,
    int user,
  }) : super(data: data, timestamp: timestamp, user: user);
  factory ClipboardDataModel.fromJson(Map<String, dynamic> json) =>
      _$ClipboardDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ClipboardDataModelToJson(this);
}