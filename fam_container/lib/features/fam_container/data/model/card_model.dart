import '../../domain/entity/card.dart';
import '../data_source/fam_datasource.dart';
import 'bg_gradient_model.dart';
import 'bg_image_model.dart';
import 'cta_model.dart';
import 'formatted_text_model.dart';

class CardModel extends Card {
  const CardModel({
    required super.id,
    required super.name,
    required super.isDisabled,
    required super.isShareable,
    required super.isInternal,
    super.formattedTitle,
    super.icon,
    super.bgImage,
    super.formattedDescription,
    super.bgGradient,
    super.iconSize = -1,
    super.url = '',
    super.slug = '',
    super.title = '',
    super.bgColor = '',
    super.description = '',
    super.cta = const [],
  });

  factory CardModel.fromJson(Json json) {
    final formattedTitle = json['formatted_title'] == null
        ? null
        : FormattedTextModel.fromJson(json['formatted_title'] as Json);
    final bgImage = json['bg_image'] == null
        ? null
        : BgImageModel.fromJson(json['bg_image'] as Json);
    final cta = json['cta'] == null
        ? <CTAModel>[]
        : (json['cta'] as List? ?? [])
            .map((x) => CTAModel.fromJson(x))
            .toList();
    final icon = json['icon'] == null
        ? null
        : BgImageModel.fromJson(json['icon'] as Json);
    final bgGradient = json['bg_gradient'] == null
        ? null
        : BgGradientModel.fromJson(json['bg_gradient'] as Json);
    final formattedDescription = json['formatted_description'] == null
        ? null
        : FormattedTextModel.fromJson(json['formatted_description'] as Json);

    return CardModel(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      url: json['url'] as String? ?? '',
      isDisabled: json['is_disabled'] as bool? ?? false,
      isShareable: json['is_shareable'] as bool? ?? false,
      isInternal: json['is_internal'] as bool? ?? false,
      bgColor: json['bg_color'] as String? ?? '',
      iconSize: json['icon_size'] as int? ?? -1,
      bgImage: bgImage,
      cta: cta,
      icon: icon,
      bgGradient: bgGradient,
      formattedTitle: formattedTitle,
      formattedDescription: formattedDescription,
    );
  }

  Json toJson() => {
        'id': id,
        'name': name,
        'slug': slug,
        'title': title,
        'formatted_title': (formattedTitle as FormattedTextModel).toJson(),
        'url': url,
        'bg_image': (bgImage as BgImageModel).toJson(),
        'cta': cta.isEmpty
            ? []
            : cta.map((x) => (x as CTAModel).toJson()).toList(),
        'is_disabled': isDisabled,
        'is_shareable': isShareable,
        'is_internal': isInternal,
        'bg_color': bgColor,
        'icon_size': iconSize,
        'description': description,
      };
}
