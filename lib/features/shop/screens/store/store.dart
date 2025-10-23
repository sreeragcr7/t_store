import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/appbar/tabbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:t_store/common/widgets/brands/brand_card.dart';
import 'package:t_store/common/widgets/shimmers/brands_shimmer.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/controllers/brand_controller.dart';
import 'package:t_store/features/shop/controllers/category_controller.dart';
import 'package:t_store/features/shop/screens/brands/all_brands.dart';
import 'package:t_store/features/shop/screens/brands/brand_products.dart';
import 'package:t_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());

    final categories = CategoryController.instance.featuredCategories;

    return DefaultTabController(
      length: categories.length,
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
                expandedHeight: 400,
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
                      TSectionHeading(title: 'Featured Brands', onPressed: () => Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      //Brands Grid
                      Obx(() {
                        if (brandController.isLoading.value) return const TBrandsShimmer();

                        if (brandController.featuredBrands.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found',
                              style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),
                            ),
                          );
                        }

                        return TGridLayout(
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 70,
                          itemBuilder: (_, index) {
                            final brand = brandController.featuredBrands[index];
                            //backend pending........
                            return TBrandCard(
                              showBorder: true,
                              brand: brand,
                              onTap: () => Get.to(() => BrandProducts(brand: brand)),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),

                //Tabs
                bottom: TTabBar(tabs: categories.map((category) => Tab(child: Text(category.name))).toList()),
              ),
            ];
          },
          //Body
          body: TabBarView(children: categories.map((category) => TCategoryTab(category: category)).toList()),
        ),
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
