import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_btn.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/size.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 14,
          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
          itemBuilder:
              (_, index) => Column(
                children: [
                  TCartItem(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          //Extra space
                          const SizedBox(width: 70),
                          //Add Remove Button
                          TProductQuantityWithAddRemoveButton(),
                        ],
                      ),

                      TProductPriceText(price: '256'),
                    ],
                  ),
                ],
              ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () {}, child: Text('Checkout \$256.0')),
      ),
    );
  }
}
