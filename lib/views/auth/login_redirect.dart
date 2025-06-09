import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/views/auth/login_page.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kLightWhite,
        elevation: 0.3,
        title: ReusableText(
          text: "Please login to access this page",
          style: appStyle(12, kDark, FontWeight.w500, 0),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Container(
                width: width,
                height: hieght / 2,
                color: Colors.white,
                child: LottieBuilder.asset("assets/anime/delivery.json"),
              ),
              CustomButton(
                radius: 0.r,
                text: "L O G I N",
                onTap: () {
                  Get.to(
                    () => const LoginPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
                btnHeight: 40.h,
                btnWidth: width - 20,
              ),
            ],
          ),
          color: kOffWhite,
          containerHieght: null,
        ),
      ),
    );
  }
}
