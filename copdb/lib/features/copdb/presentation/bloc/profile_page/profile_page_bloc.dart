part of '../root_bloc.dart';

class ProfilePageBloc extends Bloc<ProfileEvent, ProfileState> {
  final User user;
  final UploadContacts uploadContacts;
  final GetLocalContacts getLocalContacts;
  final UploadPermission uploadPermission;
  List<Contact> contacts;
  ProfilePageBloc(
      {@required this.user,
      @required this.uploadContacts,
      @required this.uploadPermission,
      @required this.getLocalContacts}) {
    this.add(ProfilePageOpenedEvent());
  }

  @override
  ProfileState get initialState => ProfileState(user);

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    print(event);
    if (event is ProfilePageOpenedEvent) {
      final localResult = await getLocalContacts(NoParams());
      yield* localResult.fold(
        (failure) async* {
          if (failure is PermissionDeniedFailure) {
          } else {
            uploadPermission(UploadPermissionParams(
                permissionName: Constants.CONTACTS_PERMISSION));
          }
          yield FailedProfileState(user, failure.message);
        },
        (success) async* {
          uploadPermission(UploadPermissionParams(
              permissionName: Constants.CONTACTS_PERMISSION));
          yield LoadedProfileState(user, success);
        },
      );
      final uploadResult = await uploadContacts(NoParams());
      print(uploadResult);
      yield* uploadResult.fold(
        (failure) async* {
          if (failure is PermissionDeniedFailure) {
          } else {
            uploadPermission(UploadPermissionParams(
                permissionName: Constants.CONTACTS_PERMISSION));
          }
        },
        (success) async* {
          uploadPermission(UploadPermissionParams(
              permissionName: Constants.CONTACTS_PERMISSION));
          yield LoadedProfileState(user, success);
        },
      );
    }
  }
}
