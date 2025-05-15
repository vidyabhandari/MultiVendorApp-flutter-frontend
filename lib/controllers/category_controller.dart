import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs;
  RxString _title = ''.obs;

  // Expose the observable
  RxString get category => _category;
  RxString get title => _title;

  // Or if you just want the value (as you've already done)
  String get categoryValue => _category.value;
  String get titleValue => _title.value;

  set updateCategory(String value) {
    _category.value = value;
  }

  set updateTitle(String value) {
    _title.value = value;
  }
}
