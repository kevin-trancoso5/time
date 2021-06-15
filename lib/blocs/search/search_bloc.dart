import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../providers/api.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Api api;
  SearchBloc({required this.api}) : super(SearchUninitialized());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    final currentState = state;

    if (event is SearchLaunch)
      yield* _mapSearchLaunchToState(currentState, event);
  }

  Stream<SearchState> _mapSearchLaunchToState(
    SearchState currentState,
    SearchLaunch event,
  ) async* {
    yield SearchLoading();
    await Future.delayed(const Duration(seconds: 2));
    yield SearchLoaded(search: event.search);
  }
}
