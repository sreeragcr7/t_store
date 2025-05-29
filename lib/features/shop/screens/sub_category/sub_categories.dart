import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Sports')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //banner
              const TRoundedImage(width: double.infinity, imageUrl: TImages.carousel2, applyImageRadius: true),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Sub-categories
              Column(
                children: [
                  //heading
                  TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 109,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
