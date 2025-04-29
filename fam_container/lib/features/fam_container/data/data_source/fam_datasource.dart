import 'dart:convert';

import 'package:fam_controller/core/debug_log/log.dart';

import '../../../../core/network_client/apis.dart';
import '../model/ui_config_model.dart';
import 'package:http/http.dart' as http;

const emptyJson = <String, Object?>{};

typedef Json<T extends Object?> = Map<String, T>;

abstract class FamDataSource {
  Future<UiConfigModel?> fetchDynamicUIConfig();
}

class FamDataSourceImpl implements FamDataSource {
  @override
  Future<UiConfigModel?> fetchDynamicUIConfig() async {
    try {
      final queryParams = {'slugs': 'famx-paypage'};
      final url = Uri.parse(Urls.famUrl(Urls.getUiConfig))
          .replace(queryParameters: queryParams);

      final json = await http.get(url);
      final body = List<Json>.from(jsonDecode(json.body));
      final uiConfig = body.map((e) => UiConfigModel.fromJson(e)).toList();

      return uiConfig.isEmpty ? null : uiConfig.first;
    } catch (e, s) {
      logError(e.toString(), s);
      return null;
    }
  }
}


