import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../otp/otp_screen.dart';


class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  String _verificationId = '';
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    isLoading(true);
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      await auth.verifyPhoneNumber(
        phoneNumber: "+91${phoneNumber.trim()}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);

          log("Auto-verification complete. User: ${userCredential.user?.uid}");
        },
        verificationFailed: (FirebaseAuthException e) {
          log("Verification failed: ${e.message}");
        },
        codeSent: (String verificationId, int? resendToken) {
          _verificationId = verificationId;
          Get.to(OtpScreen(
            verificationId: _verificationId,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          _verificationId = verificationId;
        },
        timeout: const Duration(seconds: 60),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
