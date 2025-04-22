import 'package:flutter/material.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';

class RecommendationsPage extends StatelessWidget {
  const RecommendationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "Recommendations",
          style: appStyle(13, kGray, FontWeight.w600, 0),
        ),
      ),
      body: const Center(child: Text("All Recommendations")),
    );
  }
}
