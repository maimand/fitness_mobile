import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/pages/User/update_password.dart';
import 'package:fitness_mobile/pages/User/update_profile.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:fitness_mobile/utils/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthService>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          TextButton(
            onPressed: () {
              controller.logout();
            },
            child: const Text(
              'Log out',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const SizedBox(height: 48),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.red,
              child: Text(
                (controller.userModel.value?.fullname ?? ' ')[0].toUpperCase(),
                style: const TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 50),
                Text(
                  controller.userModel.value?.fullname ?? ' ',
                  style: const TextStyle(fontSize: 28),
                ),
                IconButton(
                    tooltip: 'Update profile',
                    onPressed: () {
                      Get.to(() => const UpdateProfile());
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.red,
                    ))
              ],
            ),
            const SizedBox(height: 32),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Email:'),
                Text(controller.userModel.value?.email ?? '')
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 4,
              thickness: 1,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Gender:'),
                Text(controller.userModel.value?.gender ?? '')
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 4,
              thickness: 1,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age:'),
                Text('${controller.userModel.value?.age ?? ''}')
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 4,
              thickness: 1,
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Body Fat:'),
                Text(
                    '${(controller.userModel.value?.fatPercent ?? 0).toPercentFormat() } %')
              ],
            ),
            const SizedBox(height: 24),
            TextButton(
                onPressed: () {
                  Get.to(() => UpdatePasswordScreen());
                },
                child: const Text('Change your password'))
          ],
        ),
      ),
    );
  }
}
