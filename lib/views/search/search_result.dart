import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/search_controller.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/views/home/widgets/food_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12, 10.h, 12.h, 0),
      height: hieght,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, i) {
          FoodsModel food = controller.searchResults![i];
          return FoodTile(food: food, color: kDark);
        },
      ),
    );
  }
}
