import 'package:clean_architecture_example/features/home/domain/repositories/home_repository.dart';
import 'package:clean_architecture_example/services/networks/network_response.dart';

abstract class HomeUseCase {
  Future<NetworkResponse> getAllProducts();
}

class HomeUseCaseImpl extends HomeUseCase {
  final HomeRepository homeRepository;
  HomeUseCaseImpl(this.homeRepository);

  @override
  Future<NetworkResponse> getAllProducts() async {
    return await homeRepository.getAllProducts();
  }
}
