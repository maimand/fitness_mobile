import 'package:fitness_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Container(),),
      body: Center(
        child: Text(Get.find<AuthService>().userModel.toJson().toString()),
      ),
    );
  }
}
