import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/common/widgets/loaders/animation_loader.dart';
import 'package:t_store/features/shop/controllers/product/order_controller.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrderListItems extends StatelessWidget {
  const TOrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
      future: controller.fetchUserOrders(),
      builder: (_, snapshot) {
        //Nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Woops!, No Orders Yet!',
          animation: TImages.boxOpen,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        //Helper function: Handle Loader, No Record, No error message
        final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        //Congratulations Record found
        final orders = snapshot.data!;
        return ListView.separated(
          shrinkWrap: true,
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = orders[index];
            return TRoundedContainer(
              showBorder: true,
              padding: EdgeInsets.all(TSizes.md),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Column(
                mainAxisSize: MainAxisSize.min,

                children: [
                  //row 1
                  Row(
                    children: [
                      //icon
                      const Icon(Iconsax.ship),
                      const SizedBox(width: TSizes.spaceBtwItems / 2),

                      //status & date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                            ),
                            Text(order.formattedOrderDate, style: Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      //icon 2
                      IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  //bottom row 2
                  Row(
                    children: [
                      //Order no
                      Expanded(
                        child: Row(
                          children: [
                            //icon
                            Icon(Iconsax.tag),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            //Order
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.id,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Delivery date
                      Expanded(
                        child: Row(
                          children: [
                            //1 icon
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: TSizes.spaceBtwItems / 2),

                            //status & date
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Shipping Data',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  Text(
                                    order.formattedDeliveryDate,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
