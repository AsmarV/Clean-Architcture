import 'package:equatable/equatable.dart';
import '../../data/models/product_model.dart';

enum HomeStateStatus { LOADING, ERROR, SUCCESS }

class HomeStates extends Equatable {
  final HomeStateStatus states;
  final List<ProductModel> products;

  const HomeStates({this.states = HomeStateStatus.LOADING, required this.products});

  HomeStates copyWith({
    HomeStateStatus? states,
    List<ProductModel>? products,
  }) {
    return HomeStates(
        states: states ?? this.states, products: products ?? this.products);
  }

  @override
  List<Object?> get props => [states,products];
}
