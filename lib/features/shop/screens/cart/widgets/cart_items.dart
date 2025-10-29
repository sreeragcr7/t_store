import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/cart/add_remove_btn.dart';
import 'package:t_store/common/widgets/products/cart/cart_item.dart';
import 'package:t_store/common/widgets/texts/product_price_text.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/utils/constants/size.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveBtn = true});

  final bool showAddRemoveBtn;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections),
        itemBuilder:
            (_, index) => Obx(() {
              final item = cartController.cartItems[index];
              return Column(
                children: [
                  //Cart item
                  TCartItem(cartItem: item),
                  if (showAddRemoveBtn) const SizedBox(height: TSizes.spaceBtwItems),

                  //Add Remove btn Row with total price
                  if (showAddRemoveBtn)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //Extra space
                            const SizedBox(width: 70),
                            //Add Remove Button
                            TProductQuantityWithAddRemoveButton(
                              quantity: item.quantity,
                              add: () => cartController.addOneToCart(item),
                              remove: () => cartController.removeOnefromCart(item),
                            ),
                          ],
                        ),

                        TProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                      ],
                    ),
                ],
              );
            }),
      ),
    );
  }
}
