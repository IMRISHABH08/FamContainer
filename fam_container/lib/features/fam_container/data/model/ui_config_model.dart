import '../../domain/entity/ui_config.dart';
import '../data_source/fam_datasource.dart';
import 'hc_group_model.dart';

class UiConfigModel extends UiConfig {
  const UiConfigModel({
    required super.id,
    required super.formattedDesc,
    required super.hcGroups,
    super.slug,
    super.title,
    super.description,
    super.assets,
    super.formattedTitle,
  });

  factory UiConfigModel.fromJson(Json json) => UiConfigModel(
        id: json['id'] as int? ?? -1,
        slug: json['slug'] as String? ?? '',
        title: json['title'] as String? ?? '',
        formattedTitle: json['formatted_title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        formattedDesc: json['formatted_description'] as String? ?? '',
        assets: json['assets'] as String? ?? '',
        hcGroups: (json['hc_groups'] as List? ?? [])
            .map((x) => HcGroupModel.fromJson(x as Json))
            .toList(),
      );

  Json toJson() => {
        'id': id,
        'slug': slug,
        'title': title,
        'formatted_title': formattedTitle,
        'description': description,
        'formatted_description': formattedDesc,
        'assets': assets,
        'hc_groups':
            List<Json>.from(hcGroups.map((x) => (x as HcGroupModel).toJson())),
      };
}

