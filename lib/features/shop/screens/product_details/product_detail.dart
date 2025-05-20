import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:t_store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:t_store/features/shop/screens/product_details/widget/product_detail_image_slider.dart';
import 'package:t_store/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:t_store/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product image slider
            TProductImageSlider(),

            //Product details
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //Rating & Share
                  const TRatingAndShare(),

                  //Price, Title, Stock & Brand
                  TProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  //Attributes
                  TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections / 1.3),

                  //Checkout Button
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
                  const SizedBox(height: TSizes.spaceBtwSections / 1.5),

                  //Description
                  TSectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a product discription for blue nike sleeve less vest. There are more things that can be added but i am jsust practicing nothing else bye have a good day..',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(title: 'Reviews(199)', onPressed: () {}, showActionButton: false),
                      IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
