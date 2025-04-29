import '../../domain/entity/ui_config.dart';
import '../../domain/repository/fam_repository.dart';
import '../data_source/fam_datasource.dart';

class FamRepositoryImpl implements FamRepository {
  FamRepositoryImpl({
    required FamDataSource dataSource,
  }) : _dataSource = dataSource;

  final FamDataSource _dataSource;

  @override
  Future<UiConfig?> fetchDynamicUIConfig() {
    return _dataSource.fetchDynamicUIConfig();
  }
}
