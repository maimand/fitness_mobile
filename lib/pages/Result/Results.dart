import 'package:fitness_mobile/components/Header.dart';
import 'package:fitness_mobile/pages/Result/controllers/result_controller.dart';
import 'package:fitness_mobile/pages/Result/tracking_view.dart';
import 'package:fitness_mobile/pages/Result/widgets/log_chart.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:get/get.dart';

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final controller = Get.put(
        ResultController(Get.find<LogService>(), Get.find(), Get.find()));
    controller.getLogs();
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Header(
                  'Results',
                  rightSide: TextButton(
                      onPressed: () {
                        Get.to(() => const TrackingView());
                      },
                      child: const Text('Your trackings')),
                ),
                controller.isLoading.value
                    ? SizedBox(
                        height: Get.height * 0.8,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 25.0,
                              horizontal: 20.0,
                            ),
                            width: width,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(231, 241, 248, 1.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const LogChart(),
                                Text(
                                  'You\'ve burned',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                Text(
                                  '${controller.todayCaloriesBurned} kCal',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                RoundedProgressBar(
                                  height: 25.0,
                                  style: RoundedProgressBarStyle(
                                    borderWidth: 0,
                                    widthShadow: 0,
                                  ),
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 16.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                  percent: 28.0,
                                ),
                                Text(
                                  'You\'ve eaten',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                  ),
                                ),
                                Text(
                                  '${controller.todayCaloriesTaken} kCal',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.grey[500],
                                  ),
                                ),
                                RoundedProgressBar(
                                  height: 25.0,
                                  style: RoundedProgressBarStyle(
                                    borderWidth: 0,
                                    widthShadow: 0,
                                  ),
                                  margin: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 16.0,
                                  ),
                                  borderRadius: BorderRadius.circular(24),
                                  percent: 28.0,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 12.0,
                              left: 20.0,
                              right: 20.0,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20.0,
                                    horizontal: 30.0,
                                  ),
                                  child: const Text(
                                    'Track your body everyday to see the progress',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      context: context,
                                      builder: (BuildContext buildContext) {
                                        return Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: TextButton(
                                                  child: const Text('Gallery'),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    controller
                                                        .searchWithGallery();
                                                  },
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: TextButton(
                                                  child: const Text('Camera'),
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    controller
                                                        .searchWithCamera();
                                                  },
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          241, 227, 255, 1.0),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const <Widget>[
                                        Text(
                                          'Body Progress',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                190, 130, 255, 1.0),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Icon(
                                          Icons.camera_alt,
                                          color: Color.fromRGBO(
                                              190, 130, 255, 1.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
