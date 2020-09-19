part of 'root_bloc.dart';
class HomeState extends AuthenticatedState {
  int pageIndex;
  HomeState(User user, {this.pageIndex=0}) : super(user);
  List<Object> get props => [pageIndex, user];
}

class DeepLinkedSearchState extends HomeState {
  final String query;
  DeepLinkedSearchState(User user, this.query) : super(user, pageIndex: 1);
  List<Object> get props => [pageIndex, query, user];
}
