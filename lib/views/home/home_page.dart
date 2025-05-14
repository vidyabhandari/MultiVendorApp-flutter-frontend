import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/custom_appbar.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/heading.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/views/home/all_fastest_foods_page.dart';
import 'package:my_firstapp/views/home/all_nearby_restaurants.dart';
import 'package:my_firstapp/views/home/recommendation_page.dart';
import 'package:my_firstapp/views/home/widgets/category_list.dart';
import 'package:my_firstapp/views/home/widgets/food_list.dart';
import 'package:my_firstapp/views/home/widgets/nearby_restaurants_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          color: Colors.white,
          containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  Get.to(
                    () => const AllNearByRestaurants(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const NearbyRestaurants(),
              Heading(
                text: "Try Something New",
                onTap: () {
                  Get.to(
                    () => const RecommendationsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),

              const FoodList(code: "41007428"),
              Heading(
                text: "Food closer to you",
                onTap: () {
                  Get.to(
                    () => const AllFastestFoodsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const FoodList(code: "41007428"),
            ],
          ),
        ),
      ),
    );
  }
}
