import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/data/client/app_client.dart';
import 'package:flutter_bloc_demo/data/client/dio_module.dart';
import 'package:flutter_bloc_demo/data/repository/app_repository_impl.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/repo_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
        create: (context) =>
            AppRepositoryImpl(restClient: AppClient(DioModule().dio)),
        child: BlocProvider<ReposBloc>(
            create: (context) => ReposBloc(
                  appRepository: context.read<AppRepositoryImpl>(),
                ),
            child: Builder(
                builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: const Text("Flutter BLoC Demo"),
                      ),
                      body: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Padding(padding: EdgeInsets.only(left: 24.0)),
                            ElevatedButton(
                              child: const Text("Repos"),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => BlocProvider.value(
                                            value: BlocProvider.of<ReposBloc>(
                                                context),
                                            child: const RepoPage(),
                                          )),
                                );
                              },
                            ),
                          ]),
                    ))));
  }
}
