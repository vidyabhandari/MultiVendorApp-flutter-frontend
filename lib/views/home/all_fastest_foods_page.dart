import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/back_ground_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/constants/uidata.dart';
import 'package:my_firstapp/views/home/widgets/food_tile.dart';

class AllFastestFoodsPage extends StatelessWidget {
  const AllFastestFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Fastest Foods",
          style: appStyle(13, kLightWhite, FontWeight.w600, 0),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(foods.length, (i) {
              var food = foods[i];
              return FoodTile(food: food);
            }),
          ),
        ),
      ),
    );
  }
}
