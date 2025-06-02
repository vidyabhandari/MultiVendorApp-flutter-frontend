import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';

import 'rating_page.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});
  final Restaurantsmodel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.restaurant!.imageUrl,
                  ),
                ),

                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    width: width,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kPrimary.withOpacity(0.4),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        topLeft: Radius.circular(8.r),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBarIndicator(
                          itemCount: 5,
                          itemSize: 25,
                          rating: widget.restaurant!.rating.toDouble(),
                          itemBuilder:
                              (context, i) =>
                                  const Icon(Icons.star, color: Colors.yellow),
                        ),

                        CustomButton(
                          onTap: () {
                            Get.to(() => const RatingPage());
                          },
                          radius: 0,
                          btnColor: kSecondary,
                          btnWidth: width / 3,
                          text: "Rate Restaurant",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
