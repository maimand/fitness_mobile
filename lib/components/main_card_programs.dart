import 'package:fitness_mobile/models/exercise.dart';
import 'package:fitness_mobile/pages/Program/activity_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCardPrograms extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'For You',
    'time': '8 min',
    'image': 'assets/images/image008.jpg',
  };

  MainCardPrograms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(
          () => ActivityDetail(
            exercise: Exercise(
              image: 'assets/images/image008.jpg',
              title: 'For Your',
              time: '8 min',
              difficult: 'None',
            ),
            tag: '',
          ),
        );
      },
      child: Container(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  cardInfo['title'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  cardInfo['time'] ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                  ),
                )
              ],
            ),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
          ),
        ),
        width: size.width - 40,
        height: (size.width - 40) / 2,
        margin: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(cardInfo['image']!),
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          color: Colors.white70,
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 25.0,
              offset: Offset(8.0, 8.0),
            ),
          ],
        ),
      ),
    );
  }
}
