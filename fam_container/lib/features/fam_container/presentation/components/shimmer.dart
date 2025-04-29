import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../global/design_system/colors/colors.dart';

class FamShimmer extends StatelessWidget {
  const FamShimmer({super.key});

  Widget shimmerBox({
    double width = double.infinity,
    double height = 20,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Indra.white,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        shimmerBox(height: 180, borderRadius: BorderRadius.circular(20)),
        const SizedBox(height: 16),
        Row(
          children: [
            shimmerBox(
                width: 40, height: 40, borderRadius: BorderRadius.circular(12)),
            const SizedBox(width: 12),
            Expanded(child: shimmerBox(height: 20)),
            const SizedBox(width: 12),
            shimmerBox(
                width: 24, height: 24, borderRadius: BorderRadius.circular(8)),
          ],
        ),
        const SizedBox(height: 16),
        shimmerBox(height: 100, borderRadius: BorderRadius.circular(16)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: shimmerBox(
                    height: 120, borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 12),
            Expanded(
                child: shimmerBox(
                    height: 120, borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 12),
            Expanded(
                child: shimmerBox(
                    height: 120, borderRadius: BorderRadius.circular(12))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            shimmerBox(
                width: 40, height: 40, borderRadius: BorderRadius.circular(20)),
            const SizedBox(width: 12),
            Expanded(
                child: shimmerBox(
                    height: 20, borderRadius: BorderRadius.circular(8))),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
                child: shimmerBox(
                    height: 100, borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 12),
            Expanded(
                child: shimmerBox(
                    height: 100, borderRadius: BorderRadius.circular(12))),
          ],
        ),
      ],
    );
  }
}
