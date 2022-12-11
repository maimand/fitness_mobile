import 'package:fitness_mobile/constants/constants.dart';
import 'package:flutter/material.dart';


class SignUpScreenTopImage extends StatelessWidget {
  const SignUpScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sign Up".toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        const SizedBox(height: defaultPadding),
      ],
    );
  }
}
