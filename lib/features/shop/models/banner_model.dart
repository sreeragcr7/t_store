import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({required this.imageUrl, required this.targetScreen, required this.active});

  /// Convert BannerModel to JSON for storage
  Map<String, dynamic> toJson() {
    return {'ImageUrl': imageUrl, 'TargetScreen': targetScreen, 'Active': active};
  }

  /// Create BannerModel from JSON (e.g., Firestore or API)
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
