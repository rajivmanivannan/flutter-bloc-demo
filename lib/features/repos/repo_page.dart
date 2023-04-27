import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_bloc.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_event.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_state.dart';
import 'package:flutter_bloc_demo/features/repos/repo_Item.dart';
import 'package:flutter_bloc_demo/widgets/error_page.dart';
import 'package:flutter_bloc_demo/widgets/loading_page.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({Key? key}) : super(key: key);

  @override
  State<RepoPage> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Repos"),
      ),
      body: const _Body(),
      bottomNavigationBar: const _ButtonBar(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReposBloc, ReposState>(builder: (context, state) {
      return state is Initial
          ? const Center(child: Text("No data"))
          : state is Loading
              ? const Center(child: LoadingPage())
              : state is Success
                  ? SizedBox(
                      height: ((100 * state.githubRepos.length) +
                              MediaQuery.of(context).size.width) +
                          24.0,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                          left: 24.0,
                          right: 24.0,
                          top: 24.0,
                        ),
                        itemBuilder: (context, index) {
                          return RepoItem(
                            githubRepo: state.githubRepos[index],
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(
                          height: 20.0,
                        ),
                        itemCount: state.githubRepos.length,
                      ),
                    )
                  : state is Error
                      ? ErrorPage(
                          content: state.errorMessage,
                        )
                      : const SizedBox();
    }, listener: (context, state) {
      if (state is Initial) {
        print("Initial");
      } else if (state is Loading) {
        print("Loading");
      } else if (state is Success) {
        print("Success");
      } else if (state is Error) {
        print("Error");
      }
    });
  }
}

class _ButtonBar extends StatelessWidget {
  const _ButtonBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              child: const Text("Get Repos"),
              onPressed: () {
                final ReposBloc bloc = context.read<ReposBloc>();
                bloc.add(GetReposEvent());
              },
            ),
          ),
        ],
      ),
    );
  }
}
