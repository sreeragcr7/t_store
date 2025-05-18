import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/size.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //rating
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            SizedBox(width: TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0', style: Theme.of(context).textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
    
        //share btn
        IconButton(onPressed: () {}, icon: Icon(Icons.share, size: TSizes.iconMd)),
      ],
    );
  }
}