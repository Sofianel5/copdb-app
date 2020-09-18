part of '../root_bloc.dart';


class LandingPageBloc extends Bloc<LandingPageEvent, LandingState> {
  final GetFeed getFeed;
  List feed;
  User user;
  int page = 1;

  LandingPageBloc({@required this.user, @required this.getFeed}) {
    this.add(LandingPageCreationEvent(user: user));
  }

  @override
  LandingState get initialState => LoadingLandingState(user);

  @override
  Stream<LandingState> mapEventToState(LandingPageEvent event) async* {
    print(event);
    if (event is LandingPageCreationEvent) {
      if (feed != null) {
        yield LoadedLandingState(user, events: feed);
      } else {
        final result = await getFeed(GetFeedParams());
        yield* result.fold((failure) async* {
          yield LoadingFailedState(user, message: failure.message);
        }, (_feed) async* {
          feed = _feed;
          yield LoadedLandingState(user, events: feed);
        });
      }
    } else if (event is LandingPageRefreshEvent) {
      yield LoadingLandingState(user);
      final result = await getFeed(GetFeedParams());
      yield* result.fold((failure) async* {
        yield LoadingFailedState(user, message: failure.message);
      }, (_feed) async* {
        feed = _feed;
        yield LoadedLandingState(user, events: feed);
      });
    } 
  }
}
