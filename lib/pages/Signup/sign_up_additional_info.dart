import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/pages/Signup/components/additional_form.dart';
import 'package:flutter/material.dart';
import '../../components/background.dart';

class SignUpAdditionalInfoScreen extends StatelessWidget {
  const SignUpAdditionalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Calculate your fat percentage".toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: defaultPadding),
            Row(
              children:   [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: SignUpAdditionalForm(),
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
