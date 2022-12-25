import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/pages/Signup/qr_scanner.dart';
import 'package:fitness_mobile/pages/Signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpOptions extends StatelessWidget {
  const SignUpOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Get.to(() => const SignUpScreen());
          },
          child: const Text(
            "Free account",
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            final code = await Get.to(() => const QRViewExample());
            if(code != null) {
              Get.to(() => SignUpScreen(qr: code));
            } else {
              Get.snackbar('Error', 'Cannot get center code');
            }
          },
          style: ElevatedButton.styleFrom(
              primary: kPrimaryLightColor, elevation: 0),
          child: const Text(
            "Center account",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
