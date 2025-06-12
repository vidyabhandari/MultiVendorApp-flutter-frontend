import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_firstapp/common/custom_container.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/login_controller.dart';
import 'package:my_firstapp/views/auth/login_redirect.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');

    if (token == null) {
      return const LoginRedirect();
    }
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(height: 130),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Container(),
          color: Colors.white,
          containerHieght: null,
        ),
      ),
    );
  }
}
