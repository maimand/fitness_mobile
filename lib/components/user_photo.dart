import 'package:fitness_mobile/pages/User/user_view.dart';
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
          image: const DecorationImage(
            image: AssetImage(
              'assets/images/image009.jpg',
            ),
            fit: BoxFit.fill,
          ),
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
      ),
    );
  }
}
