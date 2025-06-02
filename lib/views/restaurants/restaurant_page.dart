import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/restaurants_model.dart';
import 'package:my_firstapp/views/restaurants/widget/restaurant_bottom_bar.dart';
import 'package:my_firstapp/views/restaurants/widget/restaurant_top_bar.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final Restaurantsmodel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

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
                  child: RestaurantBottomBar(restaurant: widget.restaurant),
                ),
                Positioned(
                  top: 40.h,
                  left: 0,
                  right: 0,
                  child: RestaurantTopBar(restaurant: widget.restaurant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
