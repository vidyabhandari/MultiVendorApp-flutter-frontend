import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_firstapp/controllers/phone_verification_controller.dart';

class VerificationServices {
  final controller = Get.put(PhoneVerificationController());
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required void Function(String verificationId, int? resendToken) codeSent,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credentials) async {
        await _auth.signInWithCredential(credentials);
        controller.verifyPhone();
      },
      verificationFailed: (FirebaseAuthException e) {
        debugPrint("Verification failed: ${e.message}");
        Get.snackbar("Error", e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        debugPrint("Code sent to $phoneNumber");
        codeSent(verificationId, resendToken);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        debugPrint("Auto retrieval timeout");
      },
    );
  }

  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await _auth.signInWithCredential(credential);
      controller.verifyPhone();
    } catch (e) {
      debugPrint("Error verifying SMS code: $e");
      Get.snackbar("Error", "Invalid code or expired.");
    }
  }
}
