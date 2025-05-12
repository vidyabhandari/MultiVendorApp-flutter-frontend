import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/constants/uidata.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:my_firstapp/models/restaurants_model.dart';

FetchHook useFetchRestaurants(String code) {
  final restaurants = useState<List<Restaurantsmodel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;

    try {
      Uri url = Uri.parse('$appBaseUrl/api/restaurant/$code');

      final response = await http.get(url);

      if (response.statusCode == 200) {
        restaurants.value = restaurantsmodelFromJson(response.body);
      } else {
        appiError.value = apiErrorFromJson(response.body);
      }
    } catch (e, stackTrace) {
      error.value = e as Exception;
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
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
