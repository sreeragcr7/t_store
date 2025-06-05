import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/loaders/shimmer_effect.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
      //Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Profile picture3
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                          ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                          : TCircularImage(
                            image: image,
                            width: 80,
                            height: 80,
                            isNetworkImage: networkImage.isNotEmpty,
                          );
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: Text('Change Profile Picture', style: Theme.of(context).textTheme.labelLarge),
                    ),
                  ],
                ),
              ),

              //Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Heading Profile Info
              TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems / 2),

              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeNameScreen()),
              ), //!
              TProfileMenu(title: 'Username', value: controller.user.value.username, onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //Heading personal info
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              TProfileMenu(title: 'E-mail', value: controller.user.value.email, onPressed: () {}),
              TProfileMenu(title: 'Phone No', value: controller.user.value.phoneNumber, onPressed: () {}),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              TProfileMenu(title: 'Date of Birth', value: '10 Oct, 1994', onPressed: () {}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text('Close Account', style: TextStyle(color: Colors.red)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
