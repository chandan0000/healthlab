import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:healthlab/presenation/Medicine/mdecine_list.dart';

class OtpController extends GetxController {
  RxBool isLoading = false.obs;
  void verifyOTP(BuildContext context,
      {required String verificationId, required String otp}) async {
    isLoading(true);
    log("token $verificationId");
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        log('Login Sucess');
        Future.delayed(const Duration(seconds: 2), () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successful!'),
              backgroundColor: Colors.green,
            ),
          );
        });
        Get.offAll(const MedicineListScreen());
      }
    } on FirebaseAuthException catch (ex) {
      log("error message otp: $ex");
      Get.snackbar(
        "Error",
        ex.message.toString(),
      );
    } finally {
      isLoading(false);
    }
  }
}
