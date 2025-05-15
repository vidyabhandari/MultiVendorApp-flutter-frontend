import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/category_controller.dart';
import 'package:my_firstapp/models/category.dart';
import 'package:my_firstapp/views/category/all_categories.dart';

class CategoryWidget extends StatelessWidget {
  final CategoriesModel category;

  CategoryWidget({super.key, required this.category});

  final controller =
      Get.find<CategoryController>(); // Use find to avoid re-creating

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category.value == 'more') {
          Get.to(
            () => const AllCategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(
        () => Container(
          width: width * 0.19,
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:
                  controller.categoryValue == category.id
                      ? kSecondary
                      : kOffWhite,
              width: 0.5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: Image.network(
                  category.imageUrl,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 35.h);
                  },
                ),
              ),
              ReusableText(
                text: category.title,
                style: appStyle(12, kDark, FontWeight.normal, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
