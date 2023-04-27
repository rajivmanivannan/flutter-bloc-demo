import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/repo_page.dart';

class HomePageWithMultiRepositoryAndMultiBlocProvider extends StatelessWidget {
  const HomePageWithMultiRepositoryAndMultiBlocProvider({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
