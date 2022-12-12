import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/pages/Diet/widgets/food_card.dart';
import 'package:flutter/material.dart';

class PredictResultView extends StatelessWidget {
  final String foodName;
  final List<Food> food;
  const PredictResultView({Key? key, required this.food, required this.foodName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Predict result'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text('That looks like $foodName. We have some reference for you:'),
              const SizedBox(height: 20),
              ...food.map((e) => FoodCard(
                food: e,
              ))

            ],
          ),
        ),
      ),
    );
  }
}
