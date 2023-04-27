import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/data/model/github_repo.dart';

class RepoItem extends StatelessWidget {
  const RepoItem({
    Key? key,
    required this.githubRepo,
  }) : super(key: key);

  final GithubRepo githubRepo;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            Text(
              'Name: ${githubRepo.name}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),Text(
              'Desc: ${githubRepo.description}',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
