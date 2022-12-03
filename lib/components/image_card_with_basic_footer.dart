import 'package:fitness_mobile/models/exercise.dart';
import 'package:flutter/material.dart';

class ImageCardWithBasicFooter extends StatelessWidget {
  final Exercise exercise;
  final String tag;
  final double? imageWidth;

  const ImageCardWithBasicFooter({Key? key,
    required this.exercise,
    required this.tag,
    this.imageWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double localWidth = size.width * 0.75;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(
          tag: tag,
          child: Container(
            width: imageWidth ?? localWidth,
            height: 160.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              image: DecorationImage(
                image: AssetImage(exercise.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          width: imageWidth ?? localWidth,
          margin: const EdgeInsets.only(top: 10.0),
          child: Text(
            exercise.title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14.0),
          ),
        ),
        Container(
          width: imageWidth ?? localWidth,
          margin: const EdgeInsets.only(top: 5.0),
          child: Text(
            '${exercise.time}    |    ${exercise.difficult}',
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
