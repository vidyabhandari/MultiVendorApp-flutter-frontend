import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/back_ground_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/common/shimmers/foodlist_shimmer.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/hooks/fetch_all_restuarants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';
import 'package:my_firstapp/views/home/widgets/restaurant_tile.dart';

class AllNearByRestaurants extends HookWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useAllFetchRestaurants("4100728");
    List<Restaurantsmodel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Nearby Restaurants",
          style: appStyle(13, kLightWhite, FontWeight.w600, 0),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child:
            isLoading
                ? const FoodsListShimmer()
                : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    children: List.generate(restaurants!.length, (i) {
                      Restaurantsmodel restaurant = restaurants[i];
                      return RestaurantTile(restaurant: restaurant);
                    }),
                  ),
                ),
      ),
    );
  }
}
