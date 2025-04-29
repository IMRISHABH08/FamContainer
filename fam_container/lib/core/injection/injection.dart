// REGISTER-SERIVCES
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/fam_container/data/data_source/fam_datasource.dart';
import '../../features/fam_container/data/repository_impl/fam_repository_impl.dart';
import '../../features/fam_container/domain/repository/fam_repository.dart';
import '../../features/fam_container/domain/usecase/fam_usecase.dart';
import 'package:get_it/get_it.dart';

import '../local_storage_service/local_cache.dart';
import '../local_storage_service/shared_pref_storage.dart';

void registerOnAppStartUpServices() {
  _registerServices();
}

// LIST ALL THE SERVICES TO BE REGISTERED
void _registerServices() {
  _initFamUIConfig();
  _initLocalStorage();
}

Future<void> _initLocalStorage() async {
  final sharedPref = await SharedPreferences.getInstance();
  if (!GetIt.I.isRegistered<LocalCache>()) {
    GetIt.I.registerSingleton<LocalCache>(SharedLocalCache(sharedPref));
  }
}

void _initFamUIConfig() {
  GetIt.I.registerLazySingleton<FamUsecase>(
      () => FamUsecaseImpl(repository: GetIt.I.get()));
  GetIt.I.registerLazySingleton<FamRepository>(
      () => FamRepositoryImpl(dataSource: GetIt.I.get()));
  GetIt.I.registerLazySingleton<FamDataSource>(() => FamDataSourceImpl());
}

//UN-REGISTER SERVICES
void unRegisterOnAppClosedServices() {
  _unRegisterServices();
}

//LIST ALL THE SERVICES TO BE UN-REGISTERED
void _unRegisterServices() {
  _unRegisterFamUIconfig();
}

void _unRegisterFamUIconfig() {
  _unregister<FamUsecase>();
  _unregister<FamRepository>();
  _unregister<FamDataSource>();
}

void _unregister<T extends Object>({String? instanceName}) {
  if (GetIt.I.isRegistered<T>(instanceName: instanceName)) {
    GetIt.I.unregister<T>(instanceName: instanceName);
  }
}
