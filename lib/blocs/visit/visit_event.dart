part of 'visit_bloc.dart';

abstract class VisitEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class VisitLaunch extends VisitEvent {
  final String search;

  VisitLaunch(this.search);
}
