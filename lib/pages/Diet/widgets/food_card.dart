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
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: Get.width,
                height: 160.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/image012.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: Get.width * 0.8,
                margin: const EdgeInsets.only(top: 10.0),
                child: Text(
                  food.name ?? '',
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ),
              Container(
                width: Get.width * 0.8,
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  '${food.calo} calories',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
