import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final TextEditingController newPassController = TextEditingController();
  final TextEditingController oldPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update your password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            TextFormField(
              controller: newPassController,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter password')]),
              onSaved: (email) {},
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Your old password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: TextFormField(
                controller: oldPassController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                cursorColor: kPrimaryColor,
                validator: MultiValidator(
                    [RequiredValidator(errorText: 'Please enter password')]),
                decoration: const InputDecoration(
                  hintText: "Your new password",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.lock),
                  ),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Get.find<AuthService>().onResetPassword(
                      newPassController.text.trim(),
                      oldPassController.text.trim());
                }
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
