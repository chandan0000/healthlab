import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/Login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController loginController = Get.put(LoginController());
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Spacer(),
                TextFormField(
                  controller: _phoneNumberController,
                  validator: (value) {
                    final regex = RegExp(r'\d{3}[\s\-\.]?\d{3}[\s\-\.]?\d{4}$');
                    if (!regex.hasMatch(value!)) {
                      return 'Invalid phone number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Enter you Phone Number",
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(
                  () => SizedBox(
                    width: 200,
                    child: loginController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                loginController.verifyPhoneNumber(
                                    phoneNumber: _phoneNumberController.text);
                              }
                            },
                            child: const Text("Continue"),
                          ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
