import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/common/styles/spacing_style.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.onPressed,
    required this.subTitle,
    required this.title,
    required this.lottieAnimation,
    required this.btnText //!M
  });

  final String title, subTitle;
  final String lottieAnimation;
  final VoidCallback onPressed;
  final String btnText; //!M

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Padding(
            padding: TSpacingStyle.paddingWithAppBarHeight * 1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lottie Animation
                  Lottie.asset(lottieAnimation, width: THelperFunctions.screenWidth() * 0.6),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Title & Subtitle
                  Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: onPressed, child: Text(btnText)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
