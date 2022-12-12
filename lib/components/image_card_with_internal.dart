import 'package:fitness_mobile/models/exercise.dart';
import 'package:fitness_mobile/pages/Program/activity_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageCardWithInternal extends StatelessWidget {
  final String image, title, duration, tag;

  const ImageCardWithInternal({
    Key? key,
    required this.image,
    required this.title,
    required this.duration,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Get.to(
          () => ActivityDetail(
            exercise: Exercise(
              image: image,
              title: title,
              time: duration,
              difficult: 'None',
            ),
            tag: tag,
          ),
        );
      },
      child: Container(
        width: size.width * 0.85,
        height: size.width * 0.60,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 4.0,
                horizontal: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20.0),
                ),
                color: Colors.black.withAlpha(900),
              ),
              child: Text(
                duration,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
