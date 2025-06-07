import 'package:flutter/material.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightWhite,
        elevation: 0.3,
        title: ReusableText(
          text: "Please login to access page",
          style: appStyle(12, kDark, FontWeight.w500, 0),
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(),
          color: kOffWhite,
          containerHieght: null,
        ),
      ),
    );
  }
}
