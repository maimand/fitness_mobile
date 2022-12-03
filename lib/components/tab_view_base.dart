import 'package:fitness_mobile/components/image_card_with_basic_footer.dart';
import 'package:fitness_mobile/data/Dishes.dart';
import 'package:fitness_mobile/models/exercise.dart';
import 'package:flutter/material.dart';

class TabViewBase extends StatelessWidget {
  final String tabName;

  const TabViewBase({Key? key, required this.tabName}) : super(key: key);

  List<Widget> _renderItem(Size size) {
    return List<Widget>.generate(dishes.length, (index) {
      var tag = dishes[index]['title'] + index.toString();
      Exercise exercise = Exercise(
        image: dishes[index]['image'],
        title: dishes[index]['title'],
        time: dishes[index]['time'],
        difficult: dishes[index]['calories'],
      );
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        child: ImageCardWithBasicFooter(
          exercise: exercise,
          tag: tag,
          imageWidth: size.width,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Track my ' + tabName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    size: 25.0,
                    color: Color.fromRGBO(122, 158, 255, 1.0),
                  )
                ],
              ),
            ),
            Column(children: _renderItem(size)),
          ],
        ),
      ),
    );
  }
}