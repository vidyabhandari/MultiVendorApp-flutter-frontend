import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';
import 'package:my_firstapp/views/restaurants/direction_page.dart';
import 'package:my_firstapp/views/restaurants/widget/restaurant_bottom_bar.dart';

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
                    child: RestaurantBottomBar(widget: widget),
                  ),
                ),

                Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Ionicons.chevron_back_circle,
                            size: 28,
                            color: kLightWhite,
                          ),
                        ),

                        ReusableText(
                          text: widget.restaurant!.title,
                          style: appStyle(13, kDark, FontWeight.w600, 0),
                        ),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => const DirectionPage());
                          },
                          child: const Icon(
                            Ionicons.location,
                            size: 28,
                            color: kLightWhite,
                          ),
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
