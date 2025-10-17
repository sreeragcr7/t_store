import 'package:get/get.dart';
import 'package:t_store/data/repositories/banner/banner_repository.dart';
import 'package:t_store/features/shop/models/banner_model.dart';
import 'package:t_store/utils/popups/loaders.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  //Variable
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final _bannerRepository = Get.put(BannerRepository());
  RxList<BannerModel> banners = <BannerModel>[].obs;
  RxList<BannerModel> featuredBanners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // Update Page navigational Dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  //Fetch Banners
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      //Fetching Banners from data source(Firestore, APT, etc...)
      final banners = await _bannerRepository.fetchBanners();

      //Assign banners
      this.banners.assignAll(banners);

      //Update the Banners list
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //Remove loader
      isLoading.value = false;
    }
  }
}
