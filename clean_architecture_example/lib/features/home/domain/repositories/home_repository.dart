import '../../../../services/networks/network_response.dart';

abstract class HomeRepository {
  Future<NetworkResponse> getAllProducts();
}
