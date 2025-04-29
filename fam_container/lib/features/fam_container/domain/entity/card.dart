import 'package:equatable/equatable.dart';

import 'bg_gradient.dart';
import 'bg_image.dart';
import 'cta.dart';
import 'formatted_text.dart';

class Card extends Equatable {
  const Card({
    required this.id,
    required this.name,
    this.formattedTitle,
    this.icon,
    this.bgImage,
    required this.isDisabled,
    required this.isShareable,
    required this.isInternal,
    this.formattedDescription,
    this.bgGradient,
    this.iconSize = -1,
    this.url = '',
    this.slug = '',
    this.title = '',
    this.bgColor = '',
    this.description = '',
    this.cta = const [],
  });

  final int id;
  final String name;
  final String slug;
  final String title;
  final FormattedText? formattedTitle;
  final String url;
  final BgImage? bgImage;
  final List<CTA> cta;
  final bool isDisabled;
  final bool isShareable;
  final bool isInternal;
  final BgImage? icon;
  final String bgColor;
  final int iconSize;
  final BgGradient? bgGradient;
  final String description;
  final FormattedText? formattedDescription;

  @override
  List<Object?> get props => [id];

  String get parsedTitle =>
      formattedTitle == null ? title : formattedTitle!.text;

  String get parsedDescription =>
      formattedDescription == null ? title : formattedDescription!.text;
}
