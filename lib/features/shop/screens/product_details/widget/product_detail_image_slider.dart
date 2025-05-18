import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            //Main large Image
            const SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.only(bottom: TSizes.productImageRadius * 5, top: TSizes.productImageRadius * 2), // default: all * 2
                child: Center(child: Image(image: AssetImage(TImages.productShirt1))),
              ),
            ),

            //Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => TRoundedImage(
                        width: 80,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(color: TColors.primary),
                        padding: const EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.nike9,
                      ),
                ),
              ),
            ),

            //Appbar
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(icon: Iconsax.heart5, height: 40, width: 40, size: TSizes.mdd, color: Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
