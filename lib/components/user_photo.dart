import 'package:fitness_mobile/pages/User/user_view.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => const UserProfileView()),
      child: Container(
        width: 54.0,
        height: 54.0,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(right: 20.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(360),
          ),
          color: Colors.redAccent,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
          border: Border.all(
            color: Colors.white,
            width: 4.0,
          ),
        ),
        child: CircleAvatar(
          radius: 27,
          backgroundColor: Colors.red,
          child: Obx(
            () => Text(
              (Get.find<AuthService>().userModel.value?.fullname ?? ' ')[0]
                  .toUpperCase(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
