import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/api_error.dart';
import 'package:my_firstapp/models/category.dart';
import 'package:my_firstapp/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchHook useFetchCategories() {
  final categoriesItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final appiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
  print('🔄 fetchData() called');
  isLoading.value = true;

  try {
    Uri url = Uri.parse('$appBaseUrl/api/category/random');
    print('🌐 Fetching from URL: $url');

    final response = await http.get(url);
    print('✅ Status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      print('📦 Category JSON: ${response.body}');
      categoriesItems.value = categoriesModelFromJson(response.body);
    } else {
      print('❌ Error response: ${response.body}');
      appiError.value = apiErrorFromJson(response.body);
    }
  } catch (e, stackTrace) {
    print('🔥 Exception: $e');
    print(stackTrace);
    error.value = e as Exception;
  } finally {
    isLoading.value = false;
  }
}

  useEffect(() {
    print('🚀 useEffect triggered');
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: categoriesItems.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
