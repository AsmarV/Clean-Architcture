

import 'package:clean_architecture_example/features/home/data/datasources/home_network_datasource.dart';
import 'package:clean_architecture_example/features/home/domain/repositories/home_repository.dart';
import 'package:clean_architecture_example/services/networks/network_response.dart';

class HomeRepositoryImp implements HomeRepository {
  final HomeNetworkDataSource dataSource;
  HomeRepositoryImp(this.dataSource);

  @override
  Future<NetworkResponse> getAllProducts() async {
    return await dataSource.getAllProducts();
  }
}