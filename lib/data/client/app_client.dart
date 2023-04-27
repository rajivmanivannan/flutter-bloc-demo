import 'package:dio/dio.dart';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';
import 'package:retrofit/http.dart';
part 'app_client.g.dart';

@RestApi()
abstract class AppClient {
  factory AppClient(Dio dio, {String baseUrl}) = _AppClient;

  @GET('/orgs/octokit/repos')
  Future<List<GithubRepo>> getRepos();
}
