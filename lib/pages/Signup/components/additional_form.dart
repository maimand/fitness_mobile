import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/data/models/user.model.dart';
import 'package:fitness_mobile/pages/Signup/controllers/calculate_fat_controller.dart';
import 'package:fitness_mobile/tabs/home_view.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class SignUpAdditionalForm extends StatelessWidget {
  SignUpAdditionalForm({
    Key? key,
  }) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController ageController = TextEditingController();
  final TextEditingController neckController = TextEditingController();
  final TextEditingController chestController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController hipController = TextEditingController();
  final TextEditingController thinghController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController sexController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalculateFatController(Get.find()));

    void onPredict() async {
      final request = UserInfoAdvancePredictRequest(
        double.tryParse(ageController.text) ?? 0,
        double.tryParse(neckController.text) ?? 0,
        double.tryParse(chestController.text) ?? 0,
        double.tryParse(waistController.text) ?? 0,
        double.tryParse(hipController.text) ?? 0,
        double.tryParse(thinghController.text) ?? 0,
        double.tryParse(weightController.text) ?? 0,
        double.tryParse(heightController.text) ?? 0,
        sexController.text,
      );
      final res = await controller.onPredictFat(request);
      if (res) {
        Get.to(() => const HomeView());
      }
    }

    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your age",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: neckController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your neck measure",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: chestController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your chest measure",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: waistController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your waist measure",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: hipController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your hip measure",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: thinghController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your thingh measure",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: weightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your weight",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: heightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your height",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: sexController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {},
              validator: MultiValidator(
                  [RequiredValidator(errorText: 'Please enter')]),
              decoration: const InputDecoration(
                hintText: "Your gender",
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                onPredict();
              }
            },
            child: Text("Update".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          ElevatedButton(
            onPressed: () {
              Get.offAll(() => const HomeView());
            },
            child: Text("Skip".toUpperCase()),
          ),
        ],
      ),
    );
  }
}
