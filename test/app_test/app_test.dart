
import 'package:flutter_bloc_demo/data/repository/app_repository_impl.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  AppRepositoryImpl,
  Storage
])
void main() {}