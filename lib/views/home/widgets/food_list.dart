import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_firstapp/common/shimmers/nearby_shimmer.dart';
import 'package:my_firstapp/hooks/fetch_foods.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/views/food/food_page.dart';
import 'package:my_firstapp/views/home/widgets/food_widget.dart';

class FoodList extends HookWidget {
  final dynamic code;

  const FoodList({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods(code);
    final List<FoodsModel>? foods = hookResults.data;
    final bool isLoading = hookResults.isLoading;

    return Container(
      height: 184.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child:
          isLoading
              ? const NearbyShimmer()
              : (foods == null || foods.isEmpty)
              ? const Center(child: Text("No foods available"))
              : ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(foods.length, (i) {
                  final food = foods[i];
                  return FoodWidget(
                    onTap: (){
                       Get.to(() => FoodPage(food: food));
                    },
                    image: food.imageUrl[0],
                    title: food.title,
                    time: food.time,
                    price: food.price.toStringAsFixed(2),
                  );
                }),
              ),
    );
  }
}
