import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onBoarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();

  //Called from main.dart on App launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function to show relevent screen
  screenRedirect() async {
    //Local Storage
    if (kDebugMode) {
      print('================ GET STORAGE auth repo ================');
      print(deviceStorage.read('isFirstTime'));
    }

    deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  //? ----------------------- Email & Password Sign-in -------------------------

  //[EmailAuthentication] - SignIn

  //[EmailAuthentication] - REGISTER

  //[ReAuthenticate] - ReAuthenticate user

  //[EmailVerification] - Email Verification

  //[EmailAuthentication] - FORGET PASSWORD

  //? ----------------------- Federate identity & Social sign-in -------------------------

  //[GoogleAuthentication] - Google

  //[FacebookAuthentication] - Instagram

  //? ----------------------- ./end Federate identity & Social sign-in -------------------------

  //[LogoutUser] - Valid for any Authentication

  //DELETE USER - Remove user Auth & Firestore Account
}
