import 'package:flutter/material.dart';

import '../design_system/colors/colors.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
    this.title = '',
    this.color = Indra.transparent,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(title),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
