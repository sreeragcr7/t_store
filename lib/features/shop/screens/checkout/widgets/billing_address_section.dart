import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/address_controller.dart';
import 'package:t_store/utils/constants/size.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TSectionHeading(
            title: 'Shipping Address',
            buttonTitle: 'Change',
            onPressed: () => addressController.selectNewAddressPopup(context),
          ),

          addressController.selectedAddress.value.id.isNotEmpty
              ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(addressController.selectedAddress.value.name, style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  Row(
                    children: [
                      const Icon(Icons.phone, color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Text(
                        addressController.selectedAddress.value.phoneNumber,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Row(
                    children: [
                      const Icon(Icons.location_history, color: Colors.grey, size: 16),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),
                      Expanded(
                        child: Text(
                          addressController.selectedAddress.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                ],
              )
              : Text('Select Address', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
