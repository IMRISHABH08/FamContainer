import '../../domain/entity/cta.dart';
import '../data_source/fam_datasource.dart';

class CTAModel extends CTA {
  CTAModel({
    required super.text,
    required super.type,
    required super.bgColor,
    required super.isCircular,
    required super.isSecondary,
    required super.strokeWidth,
  });

  factory CTAModel.fromJson(Json json) => CTAModel(
        text: json['text'] as String? ?? '',
        type: json['type'] as String? ?? '',
        bgColor: json['bg_color'] as String? ?? '',
        isCircular: json['is_circular'] as bool? ?? false,
        isSecondary: json['is_secondary'] as bool? ?? false,
        strokeWidth: json['stroke_width'] as int? ?? -1,
      );

  Json toJson() => {
        'text': text,
        'type': type,
        'bg_color': bgColor,
        'is_circular': isCircular,
        'is_secondary': isSecondary,
        'stroke_width': strokeWidth,
      };
}
