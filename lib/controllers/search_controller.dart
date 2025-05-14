import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/foods_model.dart';

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  RxBool _isTrigged = false.obs;

  bool get isTrigged => _isTrigged.value;

  set setTrigger(bool value) {
    _isTrigged.value = value;
  }

  List<FoodsModel>? searchResults;

  void searchFoods(String key) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/api/foods/search/$key");
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        searchResults = foodsModelFromJson(response.body);
        setLoading = false;
      } else {
        setLoading = false;
        var error = apiErrorFromJson(response.body);
      }
    } catch (e) {
      setLoading = false;
      debugPrint(e.toString());
    }
  }
}
