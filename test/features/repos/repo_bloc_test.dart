import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';
import 'package:flutter_bloc_demo/data/repository/app_repository_impl.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_event.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/mockito.dart';
import '../../app_test/app_test.mocks.dart';

void main(){
  const List<GithubRepo> githubRepos = [GithubRepo(id: 417862, name: "octokit.rb", description: "Ruby toolkit for the GitHub API")];
  final AppRepositoryImpl repository = MockAppRepositoryImpl();
  late ReposBloc bloc;
  late Storage hydratedStorage;
  setUp(() {
    hydratedStorage = MockStorage();
    HydratedBloc.storage = hydratedStorage;
    bloc = ReposBloc(
      appRepository: repository,
    );
  });

  group('test add event [GetRepos]', () {
    blocTest(
      'emit state when success',
      setUp: () {
        when(repository.getRepos())
            .thenAnswer((_) => Future<List<GithubRepo>>.value(githubRepos));
      },
      build: () => bloc,
      act: (_) => bloc.add(
         GetReposEvent(),
      ),
      expect: () => [
      Loading(),
        const Success(githubRepos)
      ],
    );

    blocTest(
      'emit state when failed',
      setUp: () {
        when(repository.getRepos()).thenThrow(Exception('error'));
      },
      build: () => bloc,
      act: (_) => bloc.add(
        GetReposEvent(),
      ),
      expect: () => [
     Loading(),
        const Error("error")
      ],
    );
  });
}