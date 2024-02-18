import 'dart:async';

import 'package:clean_architecture_example/features/home/data/models/product_model.dart';
import 'package:clean_architecture_example/features/home/domain/usecases/home_use_case.dart';
import 'package:clean_architecture_example/features/home/presentation/bloc/home_events.dart';
import 'package:clean_architecture_example/features/home/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.export.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final HomeUseCase homeUseCase;
  HomeBloc(this.homeUseCase) : super(const HomeStates(products: [])) {
    on<GetAllProducts>(_getAllProducts);
  }

  Future<FutureOr> _getAllProducts(
      GetAllProducts event, Emitter<HomeStates> emit) async {
    await homeUseCase.getAllProducts().then((value) {
      if (value.statusCode >= 200 && value.statusCode <= 205) {
        final List<ProductModel> newProducts = [];
        for (var json in value.data['products']) {
          newProducts.add(ProductModel.fromJson(json));
        }

        emit(state.copyWith(states: HomeStateStatus.SUCCESS, products: newProducts));
      } else if (value.statusCode >= 400 && value.statusCode <= 409) {
        emit(state.copyWith(states: HomeStateStatus.ERROR, products: []));
      }
    }).catchError((e) {
      emit(state.copyWith(states: HomeStateStatus.ERROR, products: []));
      appSnackBar(title: e.toString(), type: 'error');
      throw e;
    });
  }
}
