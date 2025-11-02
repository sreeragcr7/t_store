import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/products/payment_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/models/payment_method_model.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder:
          (_) => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Select Payment Method', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: TImages.paypal)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: TImages.gpay)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: TImages.applepay)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'VISA', image: TImages.visa)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: TImages.paytm)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: TImages.creditcard)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: TImages.mastercard)),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                ],
              ),
            ),
          ),
    );
  }
}
