

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../theme/theme.export.dart';
import '../../data/datasources/home_network_datasource.dart';
import '../../data/repositories/home_repository_imp.dart';
import '../../domain/repositories/home_repository.dart';
import '../../domain/usecases/home_use_case.dart';
import '../bloc/home_bloc.export.dart';
import '../widgets/home_view_success.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeNetworkDataSource datasource = HomeNetworkDataSourceImp();
    final HomeRepository repository = HomeRepositoryImp(datasource);
    final HomeUseCase homeUseCase = HomeUseCaseImpl(repository);
    final bloc = HomeBloc(homeUseCase);
    bloc.add(GetAllProducts());

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: buttonTextStyle,
          ),
        ),
        body: _buildView(bloc)
    );
  }

  Widget _buildView(HomeBloc bloc){
    return BlocBuilder<HomeBloc, HomeStates>(
      bloc: bloc,
      builder: (context, state) {
        if (state.states == HomeStateStatus.LOADING) {
          return const LinearProgressIndicator();
        } else if (state.states == HomeStateStatus.SUCCESS) {
          return HomeViewSuccess(prods: state.products);
        } else if (state.states == HomeStateStatus.ERROR) {
          return const LinearProgressIndicator();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
