import '../../domain/entity/bg_image.dart';
import '../data_source/fam_datasource.dart';

class BgImageModel extends BgImage {
  const BgImageModel({
    required super.imageType,
    required super.imageUrl,
    required super.aspectRatio,
  });

  factory BgImageModel.fromJson(Json json) => BgImageModel(
        imageType: json['image_type'] as String? ?? '',
        imageUrl: json['image_url'] as String? ?? '',
        aspectRatio: double.tryParse(json['aspect_ratio'].toString()) ?? 0,
      );

  Json toJson() => {
        'image_url': imageUrl,
        'image_type': imageType,
        'aspect_ratio': aspectRatio,
      };
}
