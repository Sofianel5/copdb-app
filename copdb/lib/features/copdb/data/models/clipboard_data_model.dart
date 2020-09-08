import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/clipboard_data.dart';
import 'model.dart';

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