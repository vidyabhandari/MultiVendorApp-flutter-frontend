import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/views/restaurants/rating_page.dart';
import 'package:my_firstapp/views/restaurants/restaurant_page.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.widget,
  });

  final RestaurantPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
