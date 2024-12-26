import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.export.dart';
import '../../data/models/product_model.dart';
import '../../domain/usecases/home_use_case.dart';

part 'home_events.dart';
part 'home_states.dart';

class HomeBloc extends Bloc<HomeEvents, HomeStates> {
  final HomeUseCase homeUseCase;

  factory HomeBloc.init() => HomeBloc(getIt<HomeUseCaseImpl>());

  HomeBloc(this.homeUseCase) : super(const HomeStates(products: [])) {
    on<GetAllProducts>(_getAllProducts);

    add(GetAllProducts());
  }

  Future<FutureOr> _getAllProducts(GetAllProducts event, Emitter<HomeStates> emit) async {
    final result = await homeUseCase.getAllProducts();

    result.fold(
      (l) => emit(
        state.copyWith(
          states: HomeStateStatus.ERROR,
          products: [],
          showMessage: l,
        ),
      ),
      (r) => emit(
        state.copyWith(
          states: r.isNotEmpty ? HomeStateStatus.SUCCESS : HomeStateStatus.EMPTY,
          products: r,
        ),
      ),
    );
  }
}
