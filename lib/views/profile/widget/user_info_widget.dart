import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key, this.user});

  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hieght * 0.06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 35.w,
                      child: CircleAvatar(
                        backgroundColor: kGrayLight,
                        backgroundImage:
                            user?.profile != null && user!.profile.isNotEmpty
                                ? NetworkImage(user!.profile)
                                : null,
                        child:
                            user?.profile == null || user!.profile.isEmpty
                                ? const Icon(Icons.person, color: kGray)
                                : null,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: user?.username ?? "Username",
                            style: appStyle(12, kGray, FontWeight.w600, 0),
                          ),
                          ReusableText(
                            text: user?.email ?? "emaiil@eemail.gsdfjh",
                            style: appStyle(10, kGray, FontWeight.normal, 0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(Feather.edit, color: kGray, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
