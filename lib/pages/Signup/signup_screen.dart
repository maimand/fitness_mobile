import 'package:flutter/material.dart';
import '../../components/background.dart';
import 'components/sign_up_top_image.dart';
import 'components/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  final String? qr;
  const SignUpScreen({Key? key, this.qr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SignUpScreenTopImage(),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 8,
                  child: SignUpForm(qr: qr,),
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
