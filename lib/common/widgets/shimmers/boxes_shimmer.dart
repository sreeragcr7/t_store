import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/shimmers/shimmer_effect.dart';
import 'package:t_store/utils/constants/size.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 100)),
          ],
        ),
      ],
    );
  }
}
