import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/loaders/shimmer_effect.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 46,
    this.height = 46,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        //if image background color is null, then switch it to light & dark mode color design.
        color: backgroundColor ?? (THelperFunctions.isDarkMode(context) ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child:
              isNetworkImage
                  ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: '$image?t=${DateTime.now().millisecondsSinceEpoch}',
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const TShimmerEffect(width: 55, height: 55),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  )
                  : Image(fit: fit, image: AssetImage(image), color: overlayColor),
        ),
      ),
    );
  }
}
