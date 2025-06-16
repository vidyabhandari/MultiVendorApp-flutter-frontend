import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/phone_verification_controller.dart';
import 'package:my_firstapp/services/verification_servies.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  VerificationServies _verificationService = VerificationServies();

  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold, 0),
      textColor: kDark,
      onSend: (String value) {
        controller.setPhoneNumber = value;
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }

  void _verifyPhoneNumber(String phoneNumber) async {
    final controller = Get.put(PhoneVerificationController());

    await _verificationService.verifyPhoneNumber(
      controller.phone,
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }
}
