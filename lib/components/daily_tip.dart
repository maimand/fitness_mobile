import 'package:fitness_mobile/components/news_web_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyTip extends StatelessWidget {

  final Map<String, String> element;

  const DailyTip({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.80;
    return InkWell(
      onTap: () {
        Get.to(() => NewsWebView(title: element['element'] ?? '', url: element['url'] ?? ''));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: width,
            height: 200.0,
            margin: const EdgeInsets.only(
              right: 15.0,
              bottom: 10.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(element['image'] ?? ''),
                fit: BoxFit.fill,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
          ),
          Text(
            element['title'] ?? '',
            style: const TextStyle(fontSize: 14.0),
          ),
          Container(
            width: width,
            margin: const EdgeInsets.only(top: 10.0),
            child: Text(
              element['subtitle'] ?? '',
              style: const TextStyle(
                color: Colors.black45,
                fontSize: 14.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 15.0,
            ),
            child: const Text(
              'More',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
