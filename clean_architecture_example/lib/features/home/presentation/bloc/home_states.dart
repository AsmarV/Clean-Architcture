part of 'home_bloc.dart';

enum HomeStateStatus { LOADING, ERROR, SUCCESS, EMPTY }

class HomeStates extends Equatable {
  final HomeStateStatus status;
  final String? showMessage;
  final List<ProductModel> products;

  const HomeStates({
    this.status = HomeStateStatus.LOADING,
    this.showMessage,
    required this.products,
  });

  HomeStates copyWith({
    HomeStateStatus? states,
    List<ProductModel>? products,
    String? showMessage,
  }) {
    return HomeStates(
      status: states ?? this.status,
      showMessage: showMessage ?? this.showMessage,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [status, products, showMessage];
}
