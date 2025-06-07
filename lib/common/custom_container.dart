import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_firstapp/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    required this.containerContent,
    required this.containerHieght,
    required Color color,
  });

  Widget containerContent;
  double? containerHieght;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHieght ?? MediaQuery.of(context).size.height * 0.75,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(30.r),
        ),
        child: Container(
          width: width,
          color: color ?? kOffWhite,
          child: SingleChildScrollView(child: containerContent),
        ),
      ),
    );
  }
}
