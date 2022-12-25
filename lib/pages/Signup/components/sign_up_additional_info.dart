import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/pages/Signup/components/additional_form.dart';
import 'package:fitness_mobile/pages/Signup/fat_predict_view.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:fitness_mobile/tabs/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../components/background.dart';

class SignUpAdditionalInfoScreen extends StatelessWidget {
  const SignUpAdditionalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Calculate your fat percentage".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: SignUpAdditionalForm(
                    onFinish: (double a) async {
                      await Get.to(() => PredictFatResult(
                            percent: a,
                          ));
                      await Get.find<AuthService>().getUserInformation();
                      Get.offAll(() => const HomeView());
                    },
                    onSkip: () async {
                      await Get.find<AuthService>().getUserInformation();
                      Get.offAll(() => const HomeView());
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
            // const SocalSignUp()
          ],
        ),
      ),
    );
  }
}
