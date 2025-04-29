import 'package:fam_controller/features/fam_container/domain/entity/hc_group.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../global/design_system/sizing/sizing.dart';
import '../../../../../utils/helper_methods.dart';

class Hc9Widget extends StatelessWidget {
  const Hc9Widget({super.key, required this.group});

  final HcGroup group;

  @override
  Widget build(BuildContext context) {
    final cards = group.cards;

    if (cards.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 195,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (_, i) {
          final card = cards[i];
          final radians = card.bgGradient!.radians;
          final gradientClrs = card.bgGradient!.gradientColors;

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
                gradient: gradientClrs.length > 1
                    ? LinearGradient(
                        colors: gradientClrs,
                        transform: GradientRotation(radians),
                      )
                    : null,
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
