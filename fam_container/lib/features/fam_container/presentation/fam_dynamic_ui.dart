import 'package:fam_controller/features/fam_container/domain/entity/hc_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../global/design_system/colors/colors.dart';
import '../../../global/design_system/sizing/sizing.dart';
import 'bloc/fam_container_bloc.dart';
import 'components/hc_group/hc1_widget.dart';
import 'components/hc_group/hc3_widget.dart';
import 'components/hc_group/hc5_widget.dart';
import 'components/hc_group/hc6_widget.dart';
import 'components/hc_group/hc9_widget.dart';
import 'components/shimmer.dart';

class FamPayDynamicUI extends StatelessWidget {
  const FamPayDynamicUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FamContainerBloc(usecase: GetIt.I.get()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Indra.redAccent,
          body: BlocBuilder<FamContainerBloc, FamContainerState>(
            builder: (context, state) {
              final shouldShowHcWidget =
                  (state is FetchUiConfig && state.isConfigAvailable);
              if (shouldShowHcWidget) {
                return _buildHcGroup(context, state: state);
              }
              return const FamShimmer();
            },
          ),
        ),
      ),
    );
  }
}

Widget _buildHcGroup(
  BuildContext context, {
  required FetchUiConfig state,
}) {
  final uiConfig = state.uiConfig;
  return RefreshIndicator(
    onRefresh: () async {
      context.read<FamContainerBloc>().add(OnFetchUiConfig());
    },
    child: CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, i) => Column(
              children: [
                _HcWidget(group: uiConfig.hcGroups[i]),
                const SizedBox(height: Sp.px14)
              ],
            ),
            childCount: uiConfig!.hcGroups.length,
          ),
        ),
      ],
    ),
  );
}

class _HcWidget extends StatelessWidget {
  const _HcWidget({required this.group});

  final HcGroup group;

  @override
  Widget build(BuildContext context) {
    switch (group.designType) {
      case DesignTypes.bigDisplayCard:
        return Hc3Widget(group: group);
      case DesignTypes.smallCardWithArrow:
        return Hc6Widget(group: group);
      case DesignTypes.imageCard:
        return Hc5Widget(group: group);
      case DesignTypes.dynamicWidthCard:
        return Hc9Widget(group: group);
      case DesignTypes.smallDisplayCard:
        return Hc1Widget(group: group);
      case DesignTypes.none:
        return const SizedBox.shrink();
    }
  }
}
