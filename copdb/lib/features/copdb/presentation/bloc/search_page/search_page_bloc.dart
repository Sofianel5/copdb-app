part of '../root_bloc.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchState> {
  GetCops search;
  User user;
  String searchQ;
  int page = 1;
  SearchPageBloc(this.search, this.user, {this.searchQ}) {
    if (this.searchQ != null) {
      this.add(SearchSubmitted(this.searchQ));
    }
  }

  @override
  get initialState => InitialSearchState(user);

  @override
  Stream<SearchState> mapEventToState(SearchPageEvent event) async* {
    if (event is SearchCancelled) {
      yield InitialSearchState(user);
    } else if (event is SearchSubmitted) {
      searchQ = event.query;
      yield SearchLoadingState(user);
      final result = await search(GetCopsParams(query: event.query));
      yield* result.fold((failure) async* {
        yield SearchFailedState(user, message: failure.message);
      }, (cops) async* {
        if (cops.length == 0) {
          yield NoResultsState(user);
        } else {
          yield SearchFinishedState(user, cops: cops);
        }
      });
    }
  }
}
