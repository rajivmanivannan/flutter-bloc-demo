import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repo.g.dart';

@JsonSerializable(explicitToJson: true)
class GithubRepo  extends Equatable {
  const GithubRepo({
    required this.id,
     required this.name,
     required this.description,
  });

  final int id;
  final String name;
  final String description;


  factory GithubRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRepoToJson(this);

  @override
  List<Object?> get props => [id,name, description];
}
