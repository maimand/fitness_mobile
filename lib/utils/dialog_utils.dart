import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoading({String message = ''}) => EasyLoading.show(
      indicator: const CircularProgressIndicator(),
    );

void hideLoading() => EasyLoading.dismiss();
