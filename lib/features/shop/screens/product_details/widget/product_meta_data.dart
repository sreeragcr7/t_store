import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price & sale price
        Row(
          children: [
            //sale tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withAlpha(204),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            //price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: TSizes.spaceBtwItems),
            TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //title
        TProductTitleText(title: 'Red Nike Sports Shirt'),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //stock status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        //brand
        Row(
          children: [
            TCircularImage(
              image: TImages.shoeIcon,
              width: 22,
              height: 22,
              padding: 2,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2.5),
            const TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
