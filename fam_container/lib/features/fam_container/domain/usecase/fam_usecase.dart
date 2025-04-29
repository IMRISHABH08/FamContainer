import 'package:fam_controller/features/fam_container/domain/repository/fam_repository.dart';

import '../entity/ui_config.dart';

abstract class FamUsecase {
  Future<UiConfig?> fetchDynamicUIConfig();
}

class FamUsecaseImpl implements FamUsecase {
  FamUsecaseImpl({
    required FamRepository repository,
  }) : _repository = repository;

  final FamRepository _repository;

  @override
  Future<UiConfig?> fetchDynamicUIConfig() {
  return  _repository.fetchDynamicUIConfig();
  }
}
