import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/authentication/screens/onBoarding/onboarding.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Called from main.dart on App launch
  @override
  void onReady() {
    //Remove the native splash screen
    FlutterNativeSplash.remove();
    //Redirect to appropriate screen
    screenRedirect();
  }

  //Function to show relevent screen
  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      //Local Storage
      // if (kDebugMode) {
      //   print('================ GET STORAGE auth repo ================');
      //   print(deviceStorage.read('isFirstTime'));
      // }

      deviceStorage.writeIfNull('isFirstTime', true);
      //Check if its the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen()) //Redirect to login screen if not the first time
          : Get.offAll(() => const OnBoardingScreen()); //Redirect to onBoarding Screen if it's the first time
    }
  }

  //? ----------------------- Email & Password Sign-in -------------------------

  //[EmailAuthentication] - SignIn

  //[EmailAuthentication] - REGISTER
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Something went wrong, Please try again!');
    }
  }

  //[EmailVerification] - EMAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification(); //currentUser automatically asignes
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Something went wrong, Please try again!');
    }
  }

  //[ReAuthenticate] - ReAuthenticate user

  //[EmailAuthentication] - FORGET PASSWORD

  //? ----------------------- Federate identity & Social sign-in -------------------------

  //[GoogleAuthentication] - Google

  //[FacebookAuthentication] - Instagram

  //? ----------------------- ./end Federate identity & Social sign-in -------------------------

  //[LogoutUser] - Valid for any Authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw ('Something went wrong, Please try again!');
    }
  }

  //DELETE USER - Remove user Auth & Firestore Account
}
