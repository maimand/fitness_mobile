import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/pages/Signup/components/additional_form.dart';
import 'package:fitness_mobile/pages/Signup/fat_predict_view.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/background.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Update profile',
              style: TextStyle(fontWeight: FontWeight.bold),
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
                      Get.find<AuthService>().getUserInformation(callback: () {
                        Get.back();
                      });
                    },
                    onSkip: () {
                      Get.back();
                    },
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
