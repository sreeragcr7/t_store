import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/authentication/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/size.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/circular_loader.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  //Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );

      //Clear the 'Selected' field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      //Assign selected address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      //Set the 'selected' field to true for the newly selected address.
      await addressRepository.updateSelectedField(selectedAddress.value.id, true);

      // Close the loader dialog
      Get.back();
    } catch (e) {
      // Close the loader dialog even if there's an error
      Get.back();
      TLoaders.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  //Add new Address
  Future addNewAddresses() async {
    try {
      //Start loading
      TFullScreenLoader.openLoadingDialog('Storing Address...', TImages.tailLoading);

      //Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Save address data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );
      final id = await addressRepository.addAddress(address);

      //update selected Address status
      address.id = id;
      await selectAddress(address);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //Show successfull messages
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully');

      //Refresh Addresses data
      refreshData.toggle();

      //Reset fieldsl
      resetFormFields();

      //Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      //Remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  //Show Addresses ModalBottomSheet at Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (_) => Container(
            padding: const EdgeInsets.all(TSizes.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const TSectionHeading(title: 'Select Address', showActionButton: false),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 300,
                  child: FutureBuilder(
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      //Helper function: Handle loader, No record or Error message
                      final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                      if (response != null) return response;

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder:
                            (_, index) => TSingleAddress(
                              address: snapshot.data![index],
                              onTap: () {
                                selectAddress(snapshot.data![index]);
                                Get.back();
                              },
                            ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: TSizes.defaultSpace * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const AddNewAddressScreen()),
                    child: const Text('Add new address'),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  //Function to reset form Fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
