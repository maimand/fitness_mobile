import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class CenterView extends GetView<AuthService> {
  const CenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your center'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            Container(
              width: Get.width,
              height: 160.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(controller.centerModel.value!.image ??
                      'https://evogym.vn/wp-content/uploads/2021/07/gym-center-evogym-setup-phong-gym-facebook-1024x538.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Name:'),
                Text(controller.centerModel.value?.fullname ?? '')
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
                const Text('Email:'),
                Text(controller.centerModel.value?.email ?? '')
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
                const Text('Phone:'),
                Text(controller.centerModel.value?.phone ?? '')
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
                const Text('Des:'),
                Text(controller.centerModel.value?.description ?? '')
              ],
            ),
            const SizedBox(height: 12),
            const Divider(
              height: 4,
              thickness: 1,
            ),
            const SizedBox(height: 12),
            if (controller.centerModel.value?.website != null)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Website:'),
                  InkWell(
                    onTap: () {
                      _launchUrl(controller.centerModel.value!.website!);
                    },
                    child: Text(
                      controller.centerModel.value?.website ?? '',
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch $url';
    }
  }
}
