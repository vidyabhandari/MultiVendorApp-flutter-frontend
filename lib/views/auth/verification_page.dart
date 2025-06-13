import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        title: ReusableText(
          text: "Please Verify Your Account",
          style: appStyle(12, kGray, FontWeight.w600, 0),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CustomContainer(
        color: Colors.white,
        containerContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SizedBox(
            height: hieght,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Lottie.asset("assets/anime/delivery.json"),

                SizedBox(height: 10.h),

                ReusableText(
                  text: "Verify Your Account",
                  style: appStyle(20, kPrimary, FontWeight.w600, 0),
                ),

                SizedBox(height: 5.h),

                Text(
                  "Enter the 6-digit code sent to your email, if you don't see check your spam folder!",
                  textAlign: TextAlign.justify,
                  style: appStyle(12, kGray, FontWeight.normal, 0),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
        containerHieght: null,
      ),
    );
  }
}
