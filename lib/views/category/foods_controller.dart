import 'package:get/get.dart';

class FoodsController extends GetxController {
  RxInt currentPage = 0.obs;

  void changePage(int index) {
    currentPage.value = index;
  }
}
