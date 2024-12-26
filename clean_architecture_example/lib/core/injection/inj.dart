import 'package:clean_architecture_example/features/home/data/data_sources/home_network_datasource.dart';
import 'package:clean_architecture_example/features/home/data/repositories/home_repository_imp.dart';
import 'package:clean_architecture_example/features/home/domain/usecases/home_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../services/networks/network_service.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final NetworkService service = NetworkService();

  final homeUseCase = await _initHomeUse(service);
  getIt.registerLazySingleton<HomeUseCaseImpl>(() => homeUseCase);
}

Future<HomeUseCaseImpl> _initHomeUse(service) async {
  final dataSource = HomeNetworkDataSourceImp(service);
  final repository = HomeRepositoryImp(dataSource);
  final usecase = HomeUseCaseImpl(repository);
  return usecase;
}
