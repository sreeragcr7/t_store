import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:t_store/features/shop/controllers/product/cart_controller.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:t_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/helpers/pricing_calculator.dart';
import 'package:t_store/utils/popups/loaders.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, 'US');
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Items in cart
              const TCartItems(showAddRemoveBtn: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //Coupon field
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections / 2),

              //Billing section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    //Pricing
                    const TBillingAmountSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //Divider
                    const Divider(),

                    //Payment methods
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    //Address
                    TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //Checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed:
              subTotal > 0
                  ? () => orderController.processOrder(totalAmount)
                  : () => TLoaders.warningSnackBar(
                    title: 'Empty Cart',
                    message: 'Add items in the cart in order to proceed.',
                  ),
          child: Text('Checkout \$$totalAmount'),
        ),
      ),
    );
  }
}
