import 'package:fitness_mobile/components/news_web_view.dart';
import 'package:fitness_mobile/constants/constants.dart';
import 'package:fitness_mobile/utils/double_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PredictFatResult extends StatelessWidget {
  final double percent;
  const PredictFatResult({Key? key, required this.percent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your predict result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your fat percentage is ${percent.toPercentFormat()}. We will set up your program to help you get in fit',
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(height: defaultPadding),
            RichText(
              text: TextSpan(
                  text: 'For more information, please ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'tap here.',
                      style: const TextStyle(color: Colors.redAccent),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => const NewsWebView(
                            title: 'Reference',
                            url:
                                'https://www.medicalnewstoday.com/articles/body-fat-percentage-chart')),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
