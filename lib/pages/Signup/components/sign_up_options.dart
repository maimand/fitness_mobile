import 'package:fitness_mobile/pages/Signup/components/options_signup_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../components/background.dart';

class SignUpOptionsScreen extends StatelessWidget {
  const SignUpOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: MobileWelcomeScreen(),
        ),
      ),
    );
  }
}

class MobileWelcomeScreen extends StatelessWidget {
  const MobileWelcomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children:  const [
            Spacer(),
            Expanded(
              flex: 8,
              child: SignUpOptions(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
