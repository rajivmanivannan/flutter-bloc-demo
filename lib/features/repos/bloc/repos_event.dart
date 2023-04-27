import 'package:equatable/equatable.dart';

abstract class ReposEvent extends Equatable {
  const ReposEvent();
  @override
  List<Object> get props => [];
}

class GetReposEvent extends ReposEvent {}
