import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/profile_app_bar.dart';
import 'package:my_firstapp/constants/constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: const ProfileAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          color: Colors.white,
          containerContent: Column(
            children: [
              Container(
                height: hieght * 0.06,
                width: width,
                color: kPrimary,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
