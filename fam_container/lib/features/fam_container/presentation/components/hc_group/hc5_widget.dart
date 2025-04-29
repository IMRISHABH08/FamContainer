import 'package:fam_controller/features/fam_container/domain/entity/hc_group.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../global/design_system/sizing/sizing.dart';
import '../../../../../utils/helper_methods.dart';

class Hc5Widget extends StatelessWidget {
  const Hc5Widget({super.key, required this.group});

  final HcGroup group;

  @override
  Widget build(BuildContext context) {
    final cards = group.cards;
    final aspectRatio = group.cards.first.bgImage!.aspectRatio;

    if (cards.isEmpty) return const SizedBox.shrink();

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: PageView.builder(
        controller: PageController(viewportFraction: 1),
        itemCount: cards.length,
        itemBuilder: (_, i) {
          final card = cards[i];
          return GestureDetector(
            onTap: () async {
              try {
                return launchUrl(card.url);
              } catch (_) {}
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: Sp.px16),
              decoration: BoxDecoration(
                color: card.bgColor.toColor(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  card.bgImage!.imageUrl,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
