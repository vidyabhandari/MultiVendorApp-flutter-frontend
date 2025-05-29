import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/category_controller.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchFoods useFetchFoodsByCategory(String code) {
  final controller = Get.put(CategoryController());
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = Uri.parse(
        '$appBaseUrl/api/foods/${controller.category}/$code',
      );
      final response = await http.get(url);

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      } else {
        appiError.value = apiErrorFromJson(response.body);
      }
    } catch (e) {
      error.value = e as Exception;
      debugPrint('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData(); // You may add delay if needed
    return null;
  }, []);

  void refetch() {
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
