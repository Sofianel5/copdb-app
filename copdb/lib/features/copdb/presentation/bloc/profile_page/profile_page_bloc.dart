part of '../root_bloc.dart';

class ProfilePageBloc extends Bloc<ProfileEvent, ProfileState> {
  final User user;
  final UploadContacts uploadContacts;
  final UploadPermission uploadPermission;
  ProfilePageBloc({@required this.user, @required this.uploadContacts, @required this.uploadPermission}) {
    this.add(ProfilePageOpenedEvent());
  }

  @override
  ProfileState get initialState => ProfileState(user);

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    print(event);
    if (event is ProfilePageOpenedEvent) {
      final result = await uploadContacts(NoParams());
      print(result);
      yield* result.fold((failure) async* {
        if (failure is PermissionDeniedFailure) {
        } else {
          uploadPermission(UploadPermissionParams(permissionName: Constants.CONTACTS_PERMISSION));
        }
      }, (success) async* {
        uploadPermission(UploadPermissionParams(permissionName: Constants.CONTACTS_PERMISSION));
      });
    }
  }
}
