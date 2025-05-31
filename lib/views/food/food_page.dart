import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/hooks/fetch_restaurant.dart';
import 'package:my_firstapp/models/foods_model.dart';
import 'package:my_firstapp/views/category/foods_controller.dart';
import 'package:my_firstapp/views/restaurants/restaurant_page.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodsModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodsController());
    return Scaffold(
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (i) {
                      controller.changePage(i);
                    },
                    itemCount: widget.food.imageUrl.length,
                    itemBuilder: (context, i) {
                      return Container(
                        width: width,
                        height: 230.h,
                        color: kLightWhite,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.food.imageUrl[i],
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(widget.food.imageUrl.length, (
                          index,
                        ) {
                          return Container(
                            margin: EdgeInsets.all(4.h),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  controller.currentPage == index
                                      ? kSecondary
                                      : kGrayLight,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => RestaurantPage(restaurant: hookResult.data));
                    },
                    btnWidth: 120.w,
                    text: "Open Restaurant",
                    radius: 0,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text: widget.food.title,
                        style: appStyle(18, kDark, FontWeight.w600, 0),
                      ),
                      ReusableText(
                        text: "\$ ${widget.food.price.toStringAsFixed(2)}",
                        style: appStyle(18, kPrimary, FontWeight.w600, 0),
                      ),
                    ],
                  ),

                  SizedBox(height: 5.h),
                  Text(
                    widget.food.description,
                    textAlign: TextAlign.justify,
                    style: appStyle(12, kGray, FontWeight.w400, 0),
                  ),

                  SizedBox(height: 5.h),
                  SizedBox(
                    height: 18.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(widget.food.foodTags.length, (
                        index,
                      ) {
                        final tag = widget.food.foodTags[index];
                        return Container(
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.r),
                            ),
                          ),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 6.w),
                              child: ReusableText(
                                text: tag,
                                style: appStyle(11, kWhite, FontWeight.w400, 0),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: 15.h),
                  ReusableText(
                    text: "Additives and Toppings",
                    style: appStyle(18, kDark, FontWeight.w400, 0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
