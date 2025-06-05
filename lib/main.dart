import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:t_store/app.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'firebase_options.dart';
// import 'package:flutter/rendering.dart';

// ------- Entry point of Flutter App ---------
Future<void> main() async {
  // debugPaintSizeEnabled = true;

  //.env file
  await dotenv.load(fileName: ".env");

  //widgets Binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //Init (GetX) local Storage
  await GetStorage.init();

  // Await native Splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  //Initialize Supabase
  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
    storageOptions: const StorageClientOptions(retryAttempts: 3),
  );

  //Load all the Material Design / Themes / Localizations / Bindings
  runApp(const MyApp());
}
