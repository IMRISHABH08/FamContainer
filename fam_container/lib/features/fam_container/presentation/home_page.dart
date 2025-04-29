import 'package:flutter/material.dart';

import '../../../global/design_system/colors/colors.dart';
import '../../../resources/resources.dart';
import 'fam_dynamic_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _AppBar(),
      body: const FamPayDynamicUI(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Indra.white,
      title: Image.asset(Images.famLogo, height: 48),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
