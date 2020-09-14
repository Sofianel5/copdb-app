import 'package:copdb/features/copdb/data/models/model.dart';
import 'package:copdb/features/copdb/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class UserModel extends User implements Model {
  final List<UserModel> friends;
  final List<UserModel> following;
  final List<UserModel> followers;
  UserModel({
    @required int id,
    @required String username,
    String email,
    String profilePic,
    DateTime dob,
    DateTime dateJoined,
    @required String firstName,
    @required String lastName,
    @required bool verified,
    this.followers,
    this.friends,
    this.following,
  }) : super(
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          profilePic: profilePic,
          verified: verified,
          dob: dob,
          dateJoined: dateJoined,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
