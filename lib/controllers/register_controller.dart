import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/registration_model.dart';
import 'package:my_firstapp/models/success_model.dart';
import 'package:my_firstapp/views/auth/verification_page.dart';
import 'package:my_firstapp/views/entrypoint.dart';

class RegisterController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void registrationFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse('$appBaseUrl/register');

    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );
      if (response.statusCode == 200) {
        var data = succesModelFromJson(response.body);

        setLoading = false;

        Get.snackbar(
          "You are succesfully registered",
          data.message,
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: const Icon(Ionicons.fast_food_outline),
        );
      } else {
        var error = apiErrorFromJson(response.body);

        Get.snackbar(
          "Failed to register",
          error.message,
          colorText: kLightWhite,
          backgroundColor: kRed,
          icon: const Icon(Icons.error_outline),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
