part of 'visit_bloc.dart';

abstract class VisitState extends Equatable {
  const VisitState();

  @override
  List<Object> get props => [];
}

class VisitUninitialized extends VisitState {
  VisitUninitialized();

  @override
  String toString() => 'VisitUninitialized';
}

class VisitLoading extends VisitState {
  VisitLoading();

  @override
  String toString() => 'VisitLoading';
}

class VisitLoaded extends VisitState {
  final String search;
  VisitLoaded({required this.search});

  @override
  String toString() => 'VisitLoaded with search = $search';
}
