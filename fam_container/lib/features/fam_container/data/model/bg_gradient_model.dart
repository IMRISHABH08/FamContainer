import '../../domain/entity/bg_gradient.dart';
import '../data_source/fam_datasource.dart';

class BgGradientModel extends BgGradient {
  const BgGradientModel({
    required super.angle,
    required super.colors,
  });

  factory BgGradientModel.fromJson(Json json) => BgGradientModel(
        angle: json['angle'] as int? ?? -1,
        colors:
            (json['colors'] as List? ?? []).map((x) => x as String).toList(),
      );

  Json toJson() => {
        'angle': angle,
        'colors': colors.map((x) => x).toList(),
      };
}
