import 'dart:ffi';

import 'package:adminapp/common_widgets/form_widget.dart';
import 'package:adminapp/common_widgets/sized_box_heigh_width.dart';
import 'package:adminapp/controller/login_controller.dart';
import 'package:adminapp/theme/theme.dart';
import 'package:adminapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retrofit/http.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final usedScreenSize = screenHeight * 0.05 * 3;
    final containerHeight = screenHeight - usedScreenSize;
    final LoginController  loginController = Get.put(LoginController());
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: const Color(0xFF3E11D3),
      body: SafeArea(
        child: SingleChildScrollView(child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSizedBox(height: screenHeight * 0.05),
              const Center(
                child: Text(
                  "Sign In Account",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
              CustomSizedBox(height: screenHeight * 0.05),
              Container(
                padding: const EdgeInsets.all(12),
                height: containerHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSizedBox(height: screenHeight * 0.03),
                      const Text("Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12)),
                      const CustomSizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: FormFieldWidget(
                            maxLine: 1,
                            passwordObscure: false,
                            isIconVisible: true,
                            initialValue: "",
                            onSave: (newValue) {
                              loginController.strEmail.value = newValue!;
                            },
                            onChange: (value) {
                              loginController.strEmail.value = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field cannot be empty";
                              } else if (!GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: UnderlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.red, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelStyle:
                                const TextStyle(fontSize: 14, color: textColor),
                            contentPadding:
                                const EdgeInsets.only(left: 20, top: 12),
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Enter your email",
                            hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                            child: const SizedBox(),
                          ),
                        ),
                      ),
                      const CustomSizedBox(height: 12),
                      const Text("Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12)),
                      const CustomSizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: FormFieldWidget(
                          passwordObscure:
                              loginController.isPasswordObscure.value,
                          isIconVisible: true,
                          initialValue: "",
                          onSave: (newValue) {
                            loginController.strPassword.value = newValue!;
                          },
                          onChange: (value) {
                            loginController.strPassword.value = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "This field cannot be empty";
                            } else if (value.length > 10) {
                              return "Please enter valid mobile number";
                            }
                            return null;
                          },
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: UnderlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelStyle:
                              const TextStyle(fontSize: 14, color: textColor),
                          contentPadding:
                              const EdgeInsets.only(left: 20, top: 12),
                          keyboardType: TextInputType.text,
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          hintText: "Enter password",
                          child: IconButton(
                            onPressed: () {
                              loginController.isPasswordObscure.value =
                                  !loginController.isPasswordObscure.value;
                            },
                            icon: Icon(
                              loginController.isPasswordObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      const CustomSizedBox(height: 16),
                      Row(
                        children: [
                          Checkbox(
                            value: loginController.isCheckBoxSelected.value,
                            onChanged: (value) {
                              loginController.isCheckBoxSelected.value =
                                  !loginController.isCheckBoxSelected.value;
                            },
                            activeColor: const Color(0xFF3E11D3),
                          ),
                          const Text("Remember me"),
                          const Spacer(),
                          InkWell(
                              onTap: () {},
                              child: const Text("Forgot Password?")),
                        ],
                      ),
                      loginController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  loginController.login();
                                }
                              },
                              child: Container(
                                height: 50,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xFF3E11D3),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              )
            ],
          );
        })),
      ),
    );
  }
}
