import 'package:flutter_bloc_demo/data/model/github_repo.dart';
abstract class AppRepository {
  /// Remote
  Future<List<GithubRepo>> getRepos();
}
