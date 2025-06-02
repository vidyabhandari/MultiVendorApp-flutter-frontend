import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
