import 'package:clean_architecture_example/core/core.export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../theme/theme.export.dart';
import '../bloc/home_bloc.dart';
import '../widgets/dynamic_height_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: buttonTextStyle,
        ),
      ),
      body: _buildView(),
    );
  }

  Widget _buildView() {
    return BlocConsumer<HomeBloc, HomeStates>(
      listenWhen: (previous, current) => previous != current,
      buildWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == HomeStateStatus.ERROR) {
          appSnackBar(title: state.showMessage!, type: SnackBarStatus.Error);
        }
      },
      builder: (context, state) {
        if (state.status == HomeStateStatus.LOADING) {
          return const LinearProgressIndicator();
        } else if (state.status == HomeStateStatus.SUCCESS) {
          return DynamicHeightGridView(str: state.products);
        } else if (state.status == HomeStateStatus.EMPTY) {
          return const SizedBox();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
