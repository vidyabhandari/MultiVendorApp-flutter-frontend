import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/shimmers/nearby_shimmer.dart';
import 'package:my_firstapp/hooks/fetch_restaurants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';
import 'package:my_firstapp/views/home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<Restaurantsmodel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;
    return isLoading
        ? const NearbyShimmer()
        : Container(
          height: 190.h,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(restaurants!.length, (i) {
              Restaurantsmodel restaurant = restaurants[i];
              return RestaurantWidget(
                image: restaurant.imageUrl,
                logo: restaurant.logoUrl,
                title: restaurant.title,
                time: restaurant.time,
                rating: "1234",
              );
            }),
          ),
        );
  }
}
