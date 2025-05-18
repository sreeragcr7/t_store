import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:t_store/common/widgets/icons/t_circular_icon.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
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

                  //Attributes

                  //Checkout Button

                  //Description

                  //Reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
