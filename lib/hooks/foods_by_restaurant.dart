import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/models/hook_models/hook_result.dart';

FetchFoods useFetchrestaurantFoods(String id) {
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/foods/restaurant-foods/$id');
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        foods.value = foodsModelFromJson(response.body);
      }
    } catch (e) {
      debugPrint('Restaurant ID: $id');
    } finally {
      isLoading.value = false;
    }
  }

  print('Restaurant ID: $id');
  useEffect(() {
    Future.delayed(const Duration(seconds: 3));
    fetchData();

    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchFoods(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
