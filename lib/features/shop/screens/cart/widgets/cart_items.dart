import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_btn.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveBtn = true});

  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 2,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder:
          (_, index) => Column(
            children: [
              //Cart item
              TCartItem(),
              if (showAddRemoveBtn) const SizedBox(height: TSizes.spaceBtwItems),

              //Add Remove btn Row with total price
              if (showAddRemoveBtn)
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Extra space
                        SizedBox(width: 70),
                        //Add Remove Button
                        TProductQuantityWithAddRemoveButton(),
                      ],
                    ),

                    TProductPriceText(price: '256'),
                  ],
                ),
            ],
          ),
    );
  }
}
