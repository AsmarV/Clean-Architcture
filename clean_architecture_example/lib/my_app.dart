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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc.init(),
        ),
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
