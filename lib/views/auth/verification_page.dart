import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:my_firstapp/controllers/verification_controller.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
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
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  borderWidth: 2.0,
                  textStyle: appStyle(17, kDark, FontWeight.w600, 0),
                  onCodeChanged: (String code) {},
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onSubmit: (String verificationCode) {
                    controller.setCode = verificationCode;
                  },
                ),

                SizedBox(height: 20.h),

                CustomButton(
                  radius: 0.r,
                  text: "V E R I F Y  A C C O U N T",
                  onTap: () {
                    controller.verificationFunction();
                  },
                  btnHeight: 35.h,
                  btnWidth: width,
                ),
              ],
            ),
          ),
        ),
        containerHieght: null,
      ),
    );
  }
}
