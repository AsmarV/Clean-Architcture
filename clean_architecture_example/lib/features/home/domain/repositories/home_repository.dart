import 'package:dartz/dartz.dart';

import '../../data/models/product_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<ProductModel>>> getAllProducts();
}
