import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/category_controller.dart';
import 'package:my_firstapp/models/category.dart';
import 'package:my_firstapp/views/category/categories_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  CategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(
          () => const CategoriesPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 900),
        );
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(category.imageUrl, fit: BoxFit.contain),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(12, kGray, FontWeight.normal, 0),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: kGray, size: 15.r),
    );
  }
}
