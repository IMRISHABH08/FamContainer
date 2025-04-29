
import 'package:equatable/equatable.dart';

class Entity extends Equatable {
  const Entity({
    required this.type,
    required this.fontStyle,
    required this.fontFamily,
    this.text = '',
    this.color = '',
    this.fontSize = -1,
  });

  final String text;
  final String type;
  final String color;
  final String fontStyle;
  final String fontFamily;
  final int fontSize;

  @override
  List<Object?> get props => [text, type];
}