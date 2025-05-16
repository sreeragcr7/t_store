import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.all(TSizes.md),
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            //Brand with Product count
            const TBrandCard(showBorder: false),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            //Brand Top 3 Product Images
            Row(children: images.map((image) => brandTopProductImageWidget(image, context)).toList()),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 90,
        padding: const EdgeInsets.all(TSizes.sm),
        margin: const EdgeInsets.only(right: TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        child: Image(fit: BoxFit.contain, image: AssetImage(image)),
      ),
    );
  }
}
