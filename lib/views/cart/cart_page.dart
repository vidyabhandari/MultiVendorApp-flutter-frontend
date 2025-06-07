import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(height: 130),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Container(),
          color: Colors.white,
          containerHieght: null,
        ),
      ),
    );
  }
}
