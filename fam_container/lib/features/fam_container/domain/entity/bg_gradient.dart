import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';

class BgGradient extends Equatable {
  const BgGradient({
    required this.angle,
    required this.colors,
  });

  final int angle;
  final List<String> colors;

  @override
  List<Object?> get props => [];

  double get radians => ((angle * 3.14) / 180.0);

  List<Color> get gradientColors {
    final colors = <Color>[];
    final clrs = this.colors.map((e) => e.toColor()).toList();
    for (final c in clrs) {
      if (c != null) colors.add(c);
    }
    return colors;
  }
}
