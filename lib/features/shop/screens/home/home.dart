import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/all_products/all_products.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:t_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //todo  add Const()
      body: SingleChildScrollView(
        child: Column(
          children: [
            //! --- Header ----
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  //Appbar
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  //Searchbar
                  const TSearchContainer(text: "Search in Store"),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  //Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading
                        const TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Scrollable Categories
                        const THomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //! --- Body ---
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace / 2), //Todo adjusted this
              child: Column(
                children: [
                  //Promo slider
                  const TPromoSlider(banners: [TImages.carousel1, TImages.carousel2, TImages.carousel3]),
                  const SizedBox(height: TSizes.spaceBtwSections / 2),

                  //Heading
                  TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  //Popular products
                  TGridLayout(itemCount: 6, itemBuilder: (_, index) => const TProductCardVertical()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
