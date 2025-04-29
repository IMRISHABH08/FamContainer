import '../../domain/entity/hc_group.dart';
import '../data_source/fam_datasource.dart';
import 'card_model.dart';

class HcGroupModel extends HcGroup {
  const HcGroupModel({
    required super.id,
    required super.name,
    required super.designType,
    required super.cardType,
    required super.cards,
    required super.isScrollable,
    required super.isFullWidth,
    required super.level,
    super.height = -1,
    super.slug = '',
  });

  factory HcGroupModel.fromJson(Json json) => HcGroupModel(
        id: json['id'] as int? ?? -1,
        level: json['level'] as int? ?? -1,
        height: (json['height'] as int? ?? -1).toDouble(),
        cardType: json['card_type'] as int? ?? -1,
        name: json['name'] as String? ?? '',
        designType: DesignTypes.fromKey(json['design_type'] as String? ?? ''),
        slug: json['slug'] as String? ?? '',
        isScrollable: json['is_scrollable'] as bool? ?? false,
        isFullWidth: json['is_full_width'] as bool? ?? false,
        cards: (json['cards'] as List? ?? [])
            .map((x) => CardModel.fromJson(x))
            .toList(),
      );

  Json toJson() => {
        'id': id,
        'name': name,
        'design_type': designType.type,
        'card_type': cardType,
        'cards': List<Json>.from(cards.map((x) => (x as CardModel).toJson())),
        'is_scrollable': isScrollable,
        'height': height,
        'is_full_width': isFullWidth,
        'slug': slug,
        'level': level,
      };
}
