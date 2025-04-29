import '../../domain/entity/formatted_text.dart';
import '../data_source/fam_datasource.dart';
import 'entity_model.dart';

class FormattedTextModel extends FormattedText {
  const FormattedTextModel({
    required super.text,
    required super.align,
    required super.entities,
  });
  factory FormattedTextModel.fromJson(Json json) => FormattedTextModel(
        text: json['text'] as String? ?? '',
        align: json['align'] as String? ?? '',
        entities: (json['entities'] as List? ?? [])
            .map((x) => EntityModel.fromJson(x))
            .toList(),
      );

  Json toJson() => {
        'text': text,
        'align': align,
        'entities': entities.map((x) => (x as EntityModel).toJson()).toList(),
      };
}
