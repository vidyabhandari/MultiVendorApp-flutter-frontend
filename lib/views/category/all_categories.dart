import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/back_ground_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/common/shimmers/foodlist_shimmer.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/hooks/fetch_all_categories.dart';
import 'package:my_firstapp/models/category.dart';
import 'package:my_firstapp/views/category/widgets/category_tile.dart';

class AllCategories extends HookWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoriesModel>? categories = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Categories",
          style: appStyle(12, kGray, FontWeight.w600, 0),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: hieght,
          child:
              isLoading
                  ? const FoodsListShimmer()
                  : ListView(
                    scrollDirection: Axis.vertical,
                    children: List.generate(categories!.length, (i) {
                      CategoriesModel category = categories[i];
                      return CategoryTile(category: category);
                    }),
                  ),
        ),
      ),
    );
  }
}
