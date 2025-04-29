
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';

import '../../features/fam_container/domain/entity/formatted_text.dart';

class PatternRichText extends StatelessWidget {
  const PatternRichText({
    super.key,
    required this.text,
    required this.pattern,
    required this.formattedText,
    this.normalTextStyle,
    this.replacementTextStyle,
  });

  final String text;
  final String pattern;
  final FormattedText formattedText;
  final TextStyle? normalTextStyle;
  final TextStyle? replacementTextStyle;

  List<String> get replacements =>
      formattedText.entities.map((e) => e.text).toList();

  List<Color?> get replacementColors =>
      formattedText.entities.map((e) => e.color.toColor()).toList();

  List<int> get replacementsFontSize =>
      formattedText.entities.map((e) => e.fontSize).toList();

  @override
  Widget build(BuildContext context) {
    final parts = text.split(pattern);

    List<TextSpan> spans = [];

    for (int i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(
          TextSpan(
            text: parts[i],
            style: normalTextStyle ?? const TextStyle(color: Colors.white),
          ),
        );
      }

      if (i < replacements.length) {
        spans.add(
          TextSpan(
            text: replacements[i],
            style: (replacementTextStyle ?? const TextStyle()).copyWith(
              color: i < replacementColors.length
                  ? replacementColors[i]
                  : Colors.white,
              fontSize: i < replacementsFontSize.length
                  ? replacementsFontSize[i].toDouble()
                  : 16,
            ),
          ),
        );
      }
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: RichText(
        text: TextSpan(children: spans),
      ),
    );
  }
}
