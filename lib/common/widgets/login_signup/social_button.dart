import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/authentication/controllers/login/login_controller.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.google)),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(width: TSizes.iconMd, height: TSizes.iconMd, image: AssetImage(TImages.instagram)),
          ),
        ),
      ],
    );
  }
}
