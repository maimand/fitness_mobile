import 'package:fitness_mobile/models/exercise.dart';
import 'package:fitness_mobile/pages/Program/activity_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainCardPrograms extends StatelessWidget {
  final Map<String, String> cardInfo = {
    'title': 'For You',
    'time': '8 min',
    'image': 'https://images.unsplash.com/photo-1516481265257-97e5f4bc50d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
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
              image: 'https://images.unsplash.com/photo-1516481265257-97e5f4bc50d5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80',
              title: 'For Your',
              time: '8 min',
              difficult: 'None',
            ),
            tag: '',
          ),
        );
      },
      child: Container(
        width: size.width - 40,
        height: (size.width - 40) / 2,
        margin: const EdgeInsets.only(
          top: 40.0,
          left: 20.0,
          right: 20.0,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(cardInfo['image']!),
            fit: BoxFit.cover,
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
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.95),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
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
          ),
        ),
      ),
    );
  }
}
