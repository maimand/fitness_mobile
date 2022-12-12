import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/pages/Diet/DietDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodCard extends StatelessWidget {
  final Food food;

  const FoodCard({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.to(() => DietDetailView(
                food: food,
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(8)
          ),
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Get.width,
                height: 160.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(food.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.8,
                margin: const  EdgeInsets.all(16.0),
                child: Text(
                  food.name ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ));
  }
}
