import 'package:clean_architecture_example/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

import '../data_sources/home_network_datasource.dart';
import '../models/product_model.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeNetworkDataSource dataSource;

  HomeRepositoryImp(this.dataSource);

  @override
  Future<Either<String, List<ProductModel>>> getAllProducts() async {
    try {
      final result = await dataSource.getAllProducts();

      if (result.statusCode >= 200 && result.statusCode <= 205) {
        final List<ProductModel> newProducts = [];
        for (var json in result.data['products']) {
          newProducts.add(ProductModel.fromJson(json));
        }

        return Right(newProducts);
      }

      return Left(result.responseMessage);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
