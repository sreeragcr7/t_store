import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

import 'firebase_options.dart';
// import 'package:flutter/rendering.dart';

// ------- Entry point of Flutter App ---------
Future<void> main() async {
  // debugPaintSizeEnabled = true;

  //widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Init (GetX) local Storage
  await GetStorage.init();

  // Await native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  //Load all the Material Design / Themes / Localizations / Bindings
  runApp(const MyApp());
}
