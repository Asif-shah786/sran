import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sran/core/utils/color_constant.dart';
import 'package:sran/core/utils/form_validators.dart';

import '../../controllers/signup_controller.dart';
import '../../core/utils/math_utils.dart';
import '../../core/widgets/custom_toolbar.dart';
import '../../routes/app_pages.dart';

class SignupView extends GetWidget<SignupController> {
  const SignupView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //     statusBarColor: kScaffoldBackgroundColor
    // ));
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
          children : [
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                children: [
                  SizedBox(height: getVerticalSize(50.00)),
                  Image.asset("assets/images/sran_logo.png",
                    color: kPrimaryColor,
                    height: getVerticalSize(200.00),
                    width: getVerticalSize(300.00),
                  ),
                  SizedBox(height: getVerticalSize(15.00)),
                  const Text(
                    'SIGN UP',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: getVerticalSize(5.00)),
                  const Text(
                    'Welcome  to SRAN. create your account and create your daily task.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: kSubTitleColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: getVerticalSize(5.00)),
                  Form(
                      key: controller.formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Name',
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )),
                          TextFormField(
                            keyboardType: TextInputType.name,
                            controller: controller.nameController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'John Doe',
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
                            validator: nameValidator,
                          ),
                          SizedBox(height: getVerticalSize(10.00)),
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
                          SizedBox(height: getVerticalSize(10.00)),
                          // const Text('Confirm Password',
                          //     overflow: TextOverflow.ellipsis,
                          //     textAlign: TextAlign.left,
                          //     style: TextStyle(
                          //       color: kPrimaryColor,
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.w400,
                          //     )),
                          // TextFormField(
                          //   keyboardType: TextInputType.visiblePassword,
                          //   controller: controller.confirmPasswordController,
                          //   obscureText: true,
                          //   textInputAction: TextInputAction.done,
                          //   decoration: const InputDecoration(
                          //     hintText: 're-enter password',
                          //     isDense: true,
                          //     hintStyle:
                          //     TextStyle(fontSize: 14.0, color: kGreyLightColor),
                          //     enabledBorder: UnderlineInputBorder(
                          //         borderSide:
                          //         BorderSide(color: kGreyLightColor, width: 1)),
                          //     focusedBorder: UnderlineInputBorder(
                          //         borderSide:
                          //         BorderSide(color: kPrimaryColor, width: 1)),
                          //   ),
                          //   validator: (value){
                          //     if(value!.isEmpty) {
                          //       return 'Please re-enter your password';
                          //     } else if(controller.confirmPasswordController != controller.passwordController) {
                          //       return 'Passwords does not match';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      )),
                ],
              ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 70),
                  Obx(
                        () => ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: controller.imagePath.value.isEmpty
                          ? Image.asset("assets/images/avatar.png", width: context.width / 2, height: context.width / 2, fit: BoxFit.cover)
                          : Image.file(File(controller.imagePath.value), width: context.width / 2, height: context.width / 2, fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0, bottom: 15.0),
                    child: ListTile(
                      onTap: () => controller.openImageSelect(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Color(0xffE7E7E7))),
                      title: Obx(
                            () => RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: controller.imageName.value.isEmpty ? "No file" : controller.imageName.value,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color : Color(0xff333333))),
                              TextSpan(
                                  text: controller.imageName.value.isEmpty ? " (0KB)" : " (${controller.imageSize.value}KB)",
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xffB7B7B7))),
                            ],
                          ),
                        ),
                      ),
                      trailing: Image.asset("assets/images/cloudupload_icon.png", width: 30),
                    ),
                  ),
                  const Text("Maximum 700KB",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffB7B7B7)))
                ,SizedBox(height: getVerticalSize(20),),
                  const Text(
                    'You\'r all set ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: getVerticalSize(5),),
                  const Text(
                    'Take a minute to upload a profile photo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400, color: Color(
                        0xffbaafaf)
                    ),
                  ),
                ],
              ),
            ),
          ]
        ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Obx(
              () => Container(
                alignment: Alignment.topCenter,
                height: getVerticalSize(218),
                color: Colors.transparent,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: ()=> controller.onNext(),
                      style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: kWhiteColor, fontWeight: FontWeight.w500, fontSize: 16),
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.symmetric(vertical: getVerticalSize(19),horizontal: getHorizontalSize(141))),
                      child:
                      Text(
                        controller.nextButton[controller.currentPage.value],
                      ),
                    ),
                    controller.currentPage.value != 0 ?  const SizedBox.shrink() : Container(
                      width: context.width,
                      padding: EdgeInsets.symmetric(vertical: getVerticalSize(20.00)),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              const TextSpan(
                                  text: "Already have an account? ", style: TextStyle(color: kSubTitleColor, fontSize: 14, fontWeight: FontWeight.w400)),
                              TextSpan(
                                  text: "Sign in",
                                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                                  style: const TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w600))
                            ]),
                        textAlign: TextAlign.center,
                      ),
                    )

                  ],
                ),
              ),
        ),
      ),

    );
  }
}
