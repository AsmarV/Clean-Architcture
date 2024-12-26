import 'package:clean_architecture_example/services/networks/network_service.dart';

import '../../../../services/networks/network_response.dart';

abstract class HomeNetworkDataSource {
  Future<NetworkResponse> getAllProducts();
}

class HomeNetworkDataSourceImp extends HomeNetworkDataSource {
  NetworkService service;

  HomeNetworkDataSourceImp(this.service);

  @override
  Future<NetworkResponse> getAllProducts() async {
    final response = await service.get(
      url: 'products',
    );

    return response;
  }
}
