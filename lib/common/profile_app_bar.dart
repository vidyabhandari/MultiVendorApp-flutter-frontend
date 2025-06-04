import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kOffWhite,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          // logout function
        },
        child: Icon(AntDesign.logout, size: 18.h),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/icons/usa.svg",
                  width: 15.w,
                  height: 25.h,
                ),
                SizedBox(width: 5.w),
                Container(width: 1, height: 15.h, color: kGrayLight),
                SizedBox(width: 5.w),
                ReusableText(
                  text: "USA",
                  style: appStyle(16, kDark, FontWeight.normal, 0),
                ),
                SizedBox(width: 5.w),
                GestureDetector(
                  onTap: () {
                    //redirection to the settings page
                  },
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Icon(SimpleLineIcons.settings, size: 16.h),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
