import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/data/client/app_client.dart';
import 'package:flutter_bloc_demo/data/client/dio_module.dart';
import 'package:flutter_bloc_demo/data/repository/app_repository_impl.dart';
import 'package:flutter_bloc_demo/features/home/home_page.dart';
import 'package:flutter_bloc_demo/features/home/home_page_with_multi_repository_and_multi_bloc_provider.dart';
import 'package:flutter_bloc_demo/features/repos/bloc/repos_bloc.dart';
import 'package:flutter_bloc_demo/utilities/app_bloc_observer.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    //Hydrated Bloc
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory(),
    );
    Bloc.observer = AppBlocObserver();
    //runApp(const MyApp());
    runApp(const MyAppWithMultiRepositoryAndMultiBlocProvider());
  }, (error, stack) {
// Crash log
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class MyAppWithMultiRepositoryAndMultiBlocProvider extends StatelessWidget {
  const MyAppWithMultiRepositoryAndMultiBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
              create: (context) =>
                  AppRepositoryImpl(restClient: AppClient(DioModule().dio)))
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<ReposBloc>(
                  create: (context) => ReposBloc(
                      appRepository: context.read<AppRepositoryImpl>()))
            ],
            child: MaterialApp(
              title: 'Flutter Bloc Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const HomePageWithMultiRepositoryAndMultiBlocProvider(),
            )));
  }
}
