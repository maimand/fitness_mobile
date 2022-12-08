import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  const CustomNetworkImage(
      {Key? key, required this.url, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then(
      (prefs) {
        String? token = prefs.getString('accessToken');
        if (token != null && token.isNotEmpty) {
          return Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(url, headers: {
                HttpHeaders.authorizationHeader: 'Bearer $token'
              })),
            ),
          );
        }
        return Image.asset(
          'assets/images/image001.jpg',
          height: height,
          width: width,
        );
      },
      onError: (e) {
        print(e.toString());
      },
    );
    return Image.asset(
      'assets/images/image001.jpg',
      height: height,
      width: width,
    );
  }
}
