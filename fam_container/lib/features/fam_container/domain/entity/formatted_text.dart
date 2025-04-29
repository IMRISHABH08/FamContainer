import 'package:equatable/equatable.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';

import 'entity.dart';

class FormattedText extends Equatable {
  const FormattedText({
    required this.text,
    required this.align,
    required this.entities,
  });

  final String text;
  final String align;
  final List<Entity> entities;

  @override
  List<Object?> get props => [];

  String get parsedText {
    final replacements = <String>[];
    for (final entity in entities) {
      replacements.add(entity.text);
    }
    return text.parseText(pattern: '{}', replacements: replacements);
  }
}
