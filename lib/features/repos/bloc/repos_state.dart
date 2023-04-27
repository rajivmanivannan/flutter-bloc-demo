import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';

abstract class ReposState extends Equatable {
  const ReposState();

  @override
  List<Object> get props => [];

 Map<String, dynamic>? toJson() {}
}

class Initial extends ReposState {
}

class Loading extends ReposState {}

class Success extends ReposState {
  final List<GithubRepo> githubRepos;

  const Success(this.githubRepos);

  @override
  List<Object> get props => [githubRepos];

  // For Hydrated Bloc
  @override
  Map<String, dynamic> toJson() {
    return {'githubRepos': jsonEncode(githubRepos)};
  }
}

class Error extends ReposState {
  final String errorMessage;

  const Error(this.errorMessage);
}
