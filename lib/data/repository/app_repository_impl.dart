import 'package:flutter_bloc_demo/data/client/app_client.dart';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';
import '../client/exceptions/exception_handler.dart';
import 'app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  AppRepositoryImpl({
    required AppClient restClient,
  }) : _restClient = restClient;

  late final AppClient _restClient;

  /// Remote
  @override
  Future<List<GithubRepo>> getRepos() async {
    return await _restClient
        .getRepos()
        .catchError(ExceptionHandler.handleException);
  }
}
