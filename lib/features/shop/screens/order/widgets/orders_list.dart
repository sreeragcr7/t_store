import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/custom_shapes/containers/t_rounded_container.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrdersListItems extends StatelessWidget {
  const TOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder:
          (_, index) => TRoundedContainer(
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
                    Icon(Iconsax.ship),
                    const SizedBox(width: TSizes.spaceBtwItems / 2),

                    //status & date
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),
                          ),
                          Text('07 Nov 2025', style: Theme.of(context).textTheme.headlineSmall),
                        ],
                      ),
                    ),
                    //icon 2
                    IconButton(onPressed: () {}, icon: const Icon(Iconsax.arrow_right_34, size: TSizes.iconSm)),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                //row 2
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          //icon
                          Icon(Iconsax.tag),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          //status & date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order', style: Theme.of(context).textTheme.labelMedium),
                                Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          //icon
                          const Icon(Iconsax.calendar),
                          const SizedBox(width: TSizes.spaceBtwItems / 2),

                          //status & date
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shipping Data', style: Theme.of(context).textTheme.labelMedium),
                                Text('03 Feb 2025', style: Theme.of(context).textTheme.titleMedium),
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
          ),
    );
  }
}
