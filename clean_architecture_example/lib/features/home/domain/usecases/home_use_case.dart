import 'package:clean_architecture_example/features/home/data/models/product_model.dart';
import 'package:clean_architecture_example/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

abstract class HomeUseCase {
  Future<Either<String, List<ProductModel>>> getAllProducts();
}

class HomeUseCaseImpl extends HomeUseCase {
  final HomeRepository homeRepository;

  HomeUseCaseImpl(this.homeRepository);

  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    return await homeRepository.getAllProducts();
  }
}
