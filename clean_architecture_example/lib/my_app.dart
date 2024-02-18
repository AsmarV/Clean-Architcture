import 'package:clean_architecture_example/features/home/data/datasources/home_network_datasource.dart';
import 'package:clean_architecture_example/features/home/data/repositories/home_repository_imp.dart';
import 'package:clean_architecture_example/features/home/domain/repositories/home_repository.dart';
import 'package:clean_architecture_example/features/home/domain/usecases/home_use_case.dart';
import 'package:clean_architecture_example/features/home/presentation/bloc/home_bloc.dart';
import 'package:clean_architecture_example/theme/theme.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/constants/constants.export.dart';
import 'features/home/presentation/views/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final HomeNetworkDataSource datasource = HomeNetworkDataSourceImp();
    final HomeRepository repository = HomeRepositoryImp(datasource);
    final HomeUseCase homeUseCase = HomeUseCaseImpl(repository);

    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (_) => HomeBloc(homeUseCase),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navKey,
        scaffoldMessengerKey: scaffoldKey,
        title: title,
        theme: light,
        home: const HomeScreen(),
      ),
    );
  }
}
