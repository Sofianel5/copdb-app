part of '../root_bloc.dart';

class SearchState extends HomeState {
  SearchState(User user) : super(user);
}

class InitialSearchState extends SearchState {
  InitialSearchState(User user) : super(user);
}

class SearchLoadingState extends SearchState {
  SearchLoadingState(User user) : super(user);
}

class SearchTypingState extends SearchState {
  SearchTypingState(User user) : super(user);
}

class SearchFinishedState extends SearchState {
  final List<Cop> cops;

  SearchFinishedState(User user, {@required this.cops}) : assert(cops != null), super(user);
}

class SearchFailedState extends InitialSearchState {
  final String message;
  SearchFailedState(User user, {@required this.message}): super(user);
}

class NoResultsState extends SearchFinishedState {
  NoResultsState(User user) : super(user, cops: []);
}

class SearchPoppedIn extends InitialSearchState {
  SearchPoppedIn(User user) : super(user);
}