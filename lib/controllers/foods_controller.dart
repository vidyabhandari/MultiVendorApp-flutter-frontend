import 'package:get/get.dart';
import 'package:my_firstapp/models/additivies_obs.dart';
import 'package:my_firstapp/models/foods_model.dart';

class FoodController extends GetxController {
  RxInt currrentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = <AdditiveObs>[].obs;
  RxDouble _totalPrice = 0.0.obs;

  void changePage(int index) {
    currrentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List<Additive> additives) {
    additivesList.clear();

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        checked: initialCheckValue,
      );
      additivesList.add(additive);
    }
  }

  List<String> getList() {
    List<String> ads = [];

    for (var additive in additivesList) {
      if (additive.isChecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else if (!additive.isChecked.value && ads.contains(additive.title)) {
        ads.remove(additive.title);
      }
    }
    return ads;
  }

  double get additivePrice => _totalPrice.value;

  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }

    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
