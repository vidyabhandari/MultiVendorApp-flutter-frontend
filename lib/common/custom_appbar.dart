import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      height: 110.h,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 28.r,
                  backgroundColor: kSecondary,
                  backgroundImage: const NetworkImage(
                    "https://img.freepik.com/premium-vector/avatar-profile-icon-flat-style-female-user-profile-vector-illustration-isolated-background-women-profile-sign-business-concept_157943-38866.jpg",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        text: "Deliver to",
                        style: appStyle(13, kSecondary, FontWeight.w600),
                      ),
                      SizedBox(
                        width:
                            0.65.sw, // or MediaQuery.of(context).size.width * 0.65
                        child: Text(
                          "data",
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(13, kGrayLight, FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(getTimeofDay(), style: const TextStyle(fontSize: 35)),
          ],
        ),
      ),
    );
  }

  String getTimeofDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;

    if (hour >= 0 && hour < 12) {
      return '🌞';
    } else if (hour >= 12 && hour < 16) {
      return '⛅';
    } else {
      return '🌙';
    }
  }
}
