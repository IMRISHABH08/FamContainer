import '../entity/ui_config.dart';

abstract class FamRepository {
  Future<UiConfig?> fetchDynamicUIConfig();
}
