import 'package:fam_controller/features/fam_container/domain/entity/hc_group.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';

import '../../../../../global/components/parsed_richtext_widget.dart';
import '../../../../../global/design_system/sizing/sizing.dart';
import '../../../../../utils/helper_methods.dart';

class Hc6Widget extends StatelessWidget {
  const Hc6Widget({super.key, required this.group});

  final HcGroup group;

  @override
  Widget build(BuildContext context) {
    final cards = group.cards;

    if (cards.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 60,
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
              padding: const EdgeInsets.symmetric(horizontal: Sp.px10),
              margin: const EdgeInsets.symmetric(horizontal: Sp.px16),
              decoration: BoxDecoration(
                color: card.bgColor.toColor(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(Icons.person, size: 30),
                  PatternRichText(
                    pattern: '{}',
                    text: card.formattedTitle!.text,
                    formattedText: card.formattedTitle!,
                  ),
                  const Spacer(),
                  Icon(Icons.chevron_right, size: 30),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
