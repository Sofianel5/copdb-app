import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/notification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class NotificationModel extends Notification implements Model {
  NotificationModel(
    String title,
    String body,
    Map<String, dynamic> data,
    DateTime sentAt,
  ) : super(
          title: title,
          body: body,
          sentAt: sentAt,
          data: data
        );
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);
  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}