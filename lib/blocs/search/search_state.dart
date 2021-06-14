part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchUninitialized extends SearchState {
  SearchUninitialized();

  @override
  String toString() => 'SearchUninitialized';
}

class SearchLoading extends SearchState {
  SearchLoading();

  @override
  String toString() => 'SearchLoading';
}

class SearchLoaded extends SearchState {
  final String search;
  SearchLoaded({required this.search});

  @override
  String toString() => 'SearchLoaded with search = $search';
}
