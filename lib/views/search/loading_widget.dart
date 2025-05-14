import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firstapp/constants/constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hieght,
      child: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: LottieBuilder.asset(
          "assets/anime/delivery.json",
          width: width,
          height: hieght / 2,
        ),
      ),
    );
  }
}
