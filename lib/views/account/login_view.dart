import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sran/views/account/signup_view.dart';
import '../../controllers/login_controller.dart';
import '../../core/utils/color_constant.dart';
import '../../core/utils/form_validators.dart';
import '../../core/utils/math_utils.dart';
import '../../core/widgets/custom_toolbar.dart';
import '../../routes/app_pages.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Scaffold(
            body: Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            children: [
              SizedBox(height: getVerticalSize(50.00)),
              Image.asset(
                "assets/images/sran_logo.png",
                color: kPrimaryColor,
                height: getVerticalSize(200.00),
                width: getVerticalSize(300.00),
              ),
              SizedBox(height: getVerticalSize(15.00)),
              const Text(
                'LOGIN',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: getVerticalSize(5.00)),
              const Text(
                'Welcome back to SRAN. Login to your account and complete your daily task.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: kSubTitleColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: getVerticalSize(30.00)),
              Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controller.emailController,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          hintText: 'john@gmail.com',
                          isDense: true,
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: kGreyLightColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kGreyLightColor, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1)),
                        ),
                        validator: emailValidator,
                      ),
                      SizedBox(height: getVerticalSize(10.00)),
                      const Text('Password',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          )),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: controller.passwordController,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'set password',
                          isDense: true,
                          hintStyle:
                              TextStyle(fontSize: 14.0, color: kGreyLightColor),
                          enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kGreyLightColor, width: 1)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: kPrimaryColor, width: 1)),
                        ),
                        validator: passwordValidator,
                      ),
                    ],
                  )),
              Container(
                alignment: Alignment.topRight,
                width: context.width,
                padding: EdgeInsets.symmetric(vertical: getVerticalSize(20.00)),
                child: RichText(
                  text: const TextSpan(children: [
                    TextSpan(
                        text: "Forget password? ",
                        style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: "Reset",
                        // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600))
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: getVerticalSize(30.00)),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.BOTTOMNAVIGATIONTABS);
                },
                style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 20)),
                child: const Text(
                  'Login',
                ),
              ),
              Container(
                width: context.width,
                padding: EdgeInsets.symmetric(vertical: getVerticalSize(20.00)),
                child: RichText(
                  text: TextSpan(children: [
                    const TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            color: kSubTitleColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        text: "Sign up",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(AppPages.SIGNUP),
                        style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600))
                  ]),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ],
    )));
  }
}
