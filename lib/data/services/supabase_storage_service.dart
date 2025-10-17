import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TSupabaseStorageService extends GetxController {
  static TSupabaseStorageService get instance => Get.find();

  final _supabase = Supabase.instance.client;

  //Upload local assets from IDE
  // Upload local assets from IDE to Supabase
  Future<String> uploadAssetImage(String bucketName, String assetPath, String destinationPath) async {
    try {
      //Load asset data
      final byteData = await rootBundle.load(assetPath);
      final imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);

      //Upload to Supabase
      await _supabase.storage.from(bucketName).uploadBinary(destinationPath, imageData);

      //Get public Url
      return _supabase.storage.from(bucketName).getPublicUrl(destinationPath);
    } catch (e) {
      //Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again';
      }
    }
  }

  // Upload image file from device to Supabase
  Future<String> uploadImageFile(String bucketName, XFile file, {String? customPath}) async {
    try {
      final fileBytes = await file.readAsBytes();
      final uploadPath = customPath ?? '${DateTime.now().millisecondsSinceEpoch}_${file.name}';

      await _supabase.storage.from(bucketName).uploadBinary(uploadPath, fileBytes);

      return _supabase.storage.from(bucketName).getPublicUrl(uploadPath);
    } catch (e) {
      //Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again';
      }
    }
  }

  // Upload raw image bytes to Supabase
  Future<String> uploadImageData(String bucketName, Uint8List imageData, String destinationPath) async {
    try {
      await _supabase.storage
          .from(bucketName)
          .uploadBinary(destinationPath, imageData, fileOptions: const FileOptions(upsert: true, cacheControl: '3600'));

      return _supabase.storage.from(bucketName).getPublicUrl(destinationPath);
    } catch (e) {
      //Handle exceptions gracefully
      if (e is FirebaseException) {
        throw 'Firebase Exception: ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error: ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception: ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again';
      }
    }
  }
}
