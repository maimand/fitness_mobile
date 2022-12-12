import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/pages/Diet/controllers/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietDetailView extends StatelessWidget {
  final Food food;

  DietDetailView({Key? key, required this.food}) : super(key: key);

  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Container(
              width: Get.width,
              height: 300.0,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(food.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Potion: ${food.ration}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Calories: ${food.calo}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Protein: ${food.protein}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Fat: ${food.fat}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Fiber: ${food.fiber}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Please enter no of potion'),
                  content: TextField(
                    controller: _textFieldController,
                    decoration:
                       const InputDecoration(hintText: "Number"),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Get.back();
                        Get.find<DietController>().logFood(
                            food,
                            int.tryParse(_textFieldController.text.trim()) ??
                                1);
                      },
                    ),
                  ],
                );
              });
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Track my food',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              const Icon(
                Icons.add,
                size: 25.0,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
