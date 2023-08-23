import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:healthlab/presenation/auth_screen/otp/controller/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController otpController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final OtpController _otpController = Get.put(OtpController());
 

  void _submitOtp() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      _otpController.verifyOTP(context,
          verificationId: widget.verificationId, otp: otpController.text);
    }
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "An OTP (One-Time Password) has been sent to your mobile number.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  controller: otpController,
                  appContext: context,
                  backgroundColor: Colors.transparent,
                  keyboardType: TextInputType.number,
                  pastedTextStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    activeColor: Colors.black,
                    // selectedColor: secondaryColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.black,
                  ),
                  enablePinAutofill: true,
                  animationDuration: const Duration(milliseconds: 300),
                  validator: (v) {
                    if (v!.length < 6) {
                      return "Please enter valid otp";
                    } else {
                      return null;
                    }
                  },
                  autoDisposeControllers: false,
                ),
                const SizedBox(height: 25),
                Obx(
                  () => SizedBox(
                    height: 50,
                    width: 200,
                    child: _otpController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ElevatedButton(
                            onPressed: _submitOtp,
                            child: const Text('Submit'),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
