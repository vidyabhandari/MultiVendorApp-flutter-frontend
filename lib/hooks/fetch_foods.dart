import 'package:flutter/material.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchFoods(String code) {
  final foods = useState<List<FoodsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/recommendation/$code');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
       } else {
        appiError.value = apiErrorFromJson(response.body);
        }
    } catch (e, stackTrace) {
      debugPrint('Exception: $e');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
