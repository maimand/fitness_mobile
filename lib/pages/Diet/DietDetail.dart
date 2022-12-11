import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/pages/Diet/controllers/diet_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietDetailView extends StatelessWidget {
  final Food food;
  const DietDetailView({Key? key, required this.food}) : super(key: key);

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
              height: 160.0,
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
          Get.find<DietController>().logFood(food);
        },
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(219, 228, 255, 1.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Track my food',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(122, 158, 255, 1.0),
                ),
              ),
              Icon(
                Icons.add,
                size: 25.0,
                color: Color.fromRGBO(122, 158, 255, 1.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
