import '../../domain/entity/entity.dart';
import '../data_source/fam_datasource.dart';

class EntityModel extends Entity {
  const EntityModel({
    required super.type,
    required super.fontStyle,
    required super.fontFamily,
    super.text = '',
    super.color = '',
    super.fontSize = -1,
  });
  factory EntityModel.fromJson(Json json) => EntityModel(
        text: json['text'] as String? ?? '',
        type: json['type'] as String? ?? '',
        color: json['color'] as String? ?? '',
        fontStyle: json['font_style'] as String? ?? '',
        fontFamily: json['font_family'] as String? ?? '',
        fontSize: json['font_size'] as int? ?? -1,
      );

  Json toJson() => {
        'text': text,
        'type': type,
        'color': color,
        'font_size': fontSize,
        'font_style': fontStyle,
        'font_family': fontFamily,
      };
}
