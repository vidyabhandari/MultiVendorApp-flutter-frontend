import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:lottie/lottie.dart';
import 'package:my_firstapp/common/app_style.dart';
import 'package:my_firstapp/common/back_ground_container.dart';
import 'package:my_firstapp/common/custom_button.dart';
import 'package:my_firstapp/common/reusable_text.dart';
import 'package:my_firstapp/constants/constants.dart';
import 'package:my_firstapp/controllers/register_controller.dart';
import 'package:my_firstapp/models/registration_model.dart';
import 'package:my_firstapp/views/auth/widget/email_textfield.dart';
import 'package:my_firstapp/views/auth/widget/password_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _userController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _passwordFocusNode..dispose();
    _passwordFocusNode..dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Center(
          child: ReusableText(
            text: "Foodly Foods",
            style: appStyle(20, kLightWhite, FontWeight.bold, 0),
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 30.h),
              Lottie.asset("assets/anime/delivery.json"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextfield(
                      hintText: "Username",
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        CupertinoIcons.profile_circled,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _userController,
                    ),

                    SizedBox(height: 25.h),

                    EmailTextfield(
                      hintText: "Email",
                      prefixIcon: const Icon(
                        CupertinoIcons.mail,
                        size: 22,
                        color: kGrayLight,
                      ),
                      controller: _emailController,
                    ),

                    SizedBox(height: 25.h),

                    PasswordTextfield(controller: _passwordController),

                    SizedBox(height: 30.h),

                    CustomButton(
                      radius: 0.r,
                      text: "R E G I S T E R",
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          RegistrationModel model = RegistrationModel(
                            username: _userController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );

                          String data = registrationModelToJson(model);

                          controller.registrationFunction(data);
                        }
                      },
                      btnHeight: 40.h,
                      btnWidth: width,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
