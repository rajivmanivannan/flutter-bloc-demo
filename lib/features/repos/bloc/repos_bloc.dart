import 'dart:async';
import 'dart:convert';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';
import 'package:flutter_bloc_demo/data/repository/app_repository.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_event.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ReposBloc extends Bloc<ReposEvent, ReposState> with HydratedMixin {
  final AppRepository appRepository;

  ReposBloc({
    required this.appRepository,
  }) : super(Initial()) {
    on<GetReposEvent>(getReposEventToState);
  }

  Future<FutureOr<void>> getReposEventToState(
    GetReposEvent event,
    Emitter<ReposState> emit,
  ) async {
    try {
      emit(Loading());
      final repos = await appRepository.getRepos();
      emit(Success(repos));
    } catch (error, stacktrace) {
      emit(Error(error.toString()));
    }
  }

//For Hydrated Bloc
  @override
  ReposState? fromJson(Map<String, dynamic> json) {
    try {
      final listOfRepo = (jsonDecode(json['githubRepos']) as List)
          .map((e) => GithubRepo.fromJson(e))
          .toList();
      return Success(listOfRepo);
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ReposState state) {
    if (state is Success) {
      return state.toJson();
    }
    return null;
  }
}
