import 'package:equatable/equatable.dart';

import 'card.dart';

enum DesignTypes {
  smallDisplayCard('HC1'),
  bigDisplayCard('HC3'),
  imageCard('HC5'),
  smallCardWithArrow('HC6'),
  dynamicWidthCard('HC9'),
  none('');

  final String type;
  const DesignTypes(this.type);

  factory DesignTypes.fromKey(String key) =>
      values.firstWhere((design) => (design.type == key));

  bool get isScrollable => this != dynamicWidthCard;
}

class HcGroup extends Equatable {
  const HcGroup({
    required this.id,
    required this.name,
    required this.designType,
    required this.cardType,
    required this.cards,
    required this.isScrollable,
    required this.isFullWidth,
    required this.level,
    this.height = -1,
    this.slug = '',
  });

  final int id;
  final double height;
  final int level;
  final int cardType;
  final String slug;
  final String name;
  final DesignTypes designType;
  final bool isScrollable;
  final bool isFullWidth;
  final List<Card> cards;

  @override
  List<Object?> get props => [id];

  bool get isHc1 => designType == DesignTypes.smallDisplayCard;
  bool get isHc3 => designType == DesignTypes.bigDisplayCard;
  bool get isHc5 => designType == DesignTypes.imageCard;
  bool get isHc6 => designType == DesignTypes.smallCardWithArrow;
  bool get isHc9 => designType == DesignTypes.dynamicWidthCard;

  bool get isScrollableCard => designType.isScrollable && cards.length > 1;
}
