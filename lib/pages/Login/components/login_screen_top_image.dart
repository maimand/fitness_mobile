import 'package:fitness_mobile/constants/constants.dart';
import 'package:flutter/material.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
