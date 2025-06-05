import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/common/profile_app_bar.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/views/profile/widget/user_info_widget.dart';

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
              const UserInfoWidget(),
              SizedBox(height: 10.h),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
