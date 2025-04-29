import 'package:fam_controller/features/fam_container/domain/entity/hc_group.dart';
import 'package:fam_controller/features/fam_container/presentation/bloc/fam_container_bloc.dart';
import 'package:fam_controller/utils/extentions/string_extenstions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../global/components/parsed_richtext_widget.dart';
import '../../../../../global/design_system/colors/colors.dart';
import '../../../../../global/design_system/sizing/sizing.dart';
import '../../../../../utils/helper_methods.dart';

class Hc3Widget extends StatefulWidget {
  const Hc3Widget({super.key, required this.group});

  final HcGroup group;

  @override
  State<Hc3Widget> createState() => _Hc3WidgetState();
}

class _Hc3WidgetState extends State<Hc3Widget> {
  bool _showActionCta = false;

  void _onPrimaryActionTap() {
    setState(() => _showActionCta = true);
  }

  @override
  Widget build(BuildContext context) {
    final cards = widget.group.cards;
    final bloc = context.read<FamContainerBloc>();

    return BlocConsumer<FamContainerBloc, FamContainerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (cards.isEmpty) {
          return const SizedBox.shrink();
        } else if (state is FetchUiConfig && state.hideHc3Card) {
          return const SizedBox.shrink();
        }
        return SizedBox(
            height: 350,
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
                    margin: const EdgeInsets.all(Sp.px16),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            card.bgImage!.imageUrl,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 400),
                          left: _showActionCta ? 10 : -100,
                          bottom: 20,
                          child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 1000),
                            opacity: _showActionCta ? 1.0 : 0.0,
                            child: Column(
                              children: [
                                _ActionCTA(
                                  label: 'Remind Later',
                                  onTap: () => bloc.add(OnRemindLater()),
                                ),
                                const SizedBox(height: Sp.px12),
                                _ActionCTA(
                                  label: 'Dismiss Now',
                                  onTap: () => bloc.add(OnBannerDismiss()),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin:
                              EdgeInsets.only(left: _showActionCta ? 120 : 0),
                          child: Padding(
                            padding: const EdgeInsets.all(Sp.px16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (card.formattedTitle != null)
                                  PatternRichText(
                                    pattern: '{}',
                                    text: card.formattedTitle!.text,
                                    formattedText: card.formattedTitle!,
                                  ),
                                SizedBox(height: 10),
                                if (card.formattedDescription != null)
                                  PatternRichText(
                                    pattern: '{}',
                                    text: card.formattedDescription!.text,
                                    formattedText: card.formattedDescription!,
                                  ),
                                SizedBox(height: Sp.px40),
                                ...card.cta.map(
                                  (c) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        _onPrimaryActionTap();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        backgroundColor: c.bgColor.toColor(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 12),
                                      ),
                                      child: Text(
                                        c.text,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Indra.white,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}

class _ActionCTA extends StatelessWidget {
  const _ActionCTA({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.blueAccent, fontSize: 12),
        ),
      ),
    );
  }
}
