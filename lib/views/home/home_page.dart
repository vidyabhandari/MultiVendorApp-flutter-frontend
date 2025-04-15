import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/custom_appbar.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/views/home/widgets/category_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppbar(),
      ),
      body: SafeArea(
        child: CustomContainer(containerContent: Column(
          children: [
            CategoryList()
          ],
        )),
      ),
    );
  }
}
