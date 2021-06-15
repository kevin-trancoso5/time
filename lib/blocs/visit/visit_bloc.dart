import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../providers/api.dart';

part 'visit_event.dart';
part 'visit_state.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final Api api;
  VisitBloc({required this.api}) : super(VisitUninitialized());

  @override
  Stream<VisitState> mapEventToState(VisitEvent event) async* {
    final currentState = state;

    if (event is VisitLaunch)
      yield* _mapSearchLaunchToState(currentState, event);
  }

  Stream<VisitState> _mapSearchLaunchToState(
    VisitState currentState,
    VisitLaunch event,
  ) async* {
    yield VisitLoading();
    await Future.delayed(const Duration(seconds: 2));
    yield VisitLoaded(search: event.search);
  }
}
