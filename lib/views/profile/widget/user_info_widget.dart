import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/profile_app_bar.dart';
import 'package:my_firstapp/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: const ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: const Column(children: [UserInfoWidget()]),
          color: kOffWhite,
        ),
      ),
    );
  }
}
