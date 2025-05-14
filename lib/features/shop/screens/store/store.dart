import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
// import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/products/product_cards/t_brand_card.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
// import 'package:t_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:t_store/utils/constants/colors.dart';
// import 'package:t_store/utils/constants/enums.dart';
// import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        //Appbar
        appBar: TAppBar(
          title: Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          //Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 440,
                //space btw appbar & tabbar
                automaticallyImplyLeading: false,
                backgroundColor: THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //Search bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections / 2),

                      //Featured Brands
                      TSectionHeading(title: 'Featured Brands', onPressed: () {}),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      //Brands Grid
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 70,
                        itemBuilder: (_, index) {
                          //backend pending........
                          return const TBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                //Tabs
                bottom: const TTabBar(
                  tabs: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Cloths')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              //Todo handy
              TStoreTabContent(),
              TStoreTabContent(),
              TStoreTabContent(),
              TStoreTabContent(),
              TStoreTabContent(),
            ],
          ),
        ),
      ),
    );
  }
}

//ToDo handy
class TStoreTabContent extends StatelessWidget {
  const TStoreTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          TRoundedContainer(
            showBorder: true,
            borderColor: TColors.darkGrey,
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Column(children: const [TBrandCard(showBorder: true)]),
          ),
          TRoundedContainer(
            showBorder: true,
            borderColor: TColors.darkGrey,
            backgroundColor: Colors.transparent,
            margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
            child: Column(children: const [TBrandCard(showBorder: true)]),
          ),
          // Additional Products...
        ],
      ),
    );
  }
}


//! as per Tutorial
// Padding(
              //   padding: const EdgeInsets.all(TSizes.defaultSpace),
              //   child: Column(
              //     children: [
              //       //Brands
              //       TRoundedContainer(
              //         showBorder: true,
              //         borderColor: TColors.darkGrey,
              //         backgroundColor: Colors.transparent,
              //         margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
              //         child: Column(
              //           children: [
              //             //Brand with products Count
              //             const TBrandCard(showBorder: true),

              //             //Brand Top 3 Product Images
              //           ],
              //         ),
              //       ),
              //       //Products
              //     ],
              //   ),
              // ),
