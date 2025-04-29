import 'dart:ui';

extension ParsedStringFromPattern on String {
  String parseText({
    required String pattern,
    required List<String> replacements,
  }) {
    final parts = split(pattern);
    final buffer = StringBuffer();

    for (int i = 0; i < parts.length; i++) {
      buffer.write(parts[i]);
      if (i < replacements.length) buffer.write(replacements[i]);
    }
    return buffer.toString();
  }
}

extension ColorExtension on String {
  Color? toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
    return null;
  }
}
