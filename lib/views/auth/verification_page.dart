import 'package:flutter/material.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/constants/constants.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: CustomContainer(
        containerContent: Container(),
        containerHieght: null,
        color: kOffWhite,
      ),
    );
  }
}
