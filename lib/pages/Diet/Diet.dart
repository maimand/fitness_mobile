import 'package:fitness_mobile/components/daily_tip.dart';
import 'package:fitness_mobile/components/section.dart';
import 'package:fitness_mobile/pages/Diet/controllers/diet_controller.dart';
import 'package:fitness_mobile/pages/Diet/widgets/food_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Diet extends StatelessWidget {
  const Diet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DietController(Get.find(), Get.find()));
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 28),
              child: Text(
                'Diet',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 20.0),
            //   padding: const EdgeInsets.only(bottom: 20.0),
            //   decoration: BoxDecoration(
            //     color: Colors.red[50],
            //   ),
            //   child: Column(
            //     children: const <Widget>[
            //       Section(
            //         title: 'Daily tips',
            //         horizontalList: <Widget>[
            //           DailyTip(
            //             element: {
            //               'title': '16 Main workout tips',
            //               'subtitle':
            //               'The American Council on Exercises (ACE) recently surveyed 3,000 ',
            //               'image':
            //               'https://images.pexels.com/photos/1552242/pexels-photo-1552242.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            //               'url':
            //               'https://zenhabits.net/16-tips-to-triple-your-workout-effectiveness/',
            //             },
            //           ),
            //           DailyTip(
            //             element: {
            //               'title':
            //               '10 Best Weight Gain Exercises, According to Experts & Research',
            //               'subtitle':
            //               'Just like with losing weight, gaining weight is also ',
            //               'image':
            //               'https://images.pexels.com/photos/841130/pexels-photo-841130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            //               'url':
            //               'https://blog.decathlon.in/articles/weight-gain-exercise',
            //             },
            //           ),
            //           DailyTip(
            //             element: {
            //               'title':
            //               'How To Lose Weight In The Gym: 4 Simple Steps',
            //               'subtitle':
            //               'Losing weight and getting fit is really straightforward',
            //               'image':
            //               'https://images.pexels.com/photos/2729899/pexels-photo-2729899.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            //               'url':
            //               'https://www.wikihow.com/Lose-Weight-at-the-Gym',
            //             },
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.red, width: 1))),
                    child: TextField(
                      controller: controller.searchController,
                      onSubmitted: (val) => controller.onChange(),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Search your food',
                        suffix: InkWell(
                          onTap: () {
                            controller.onClear();
                          },
                          child: const Text(
                            'Clear',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  tooltip: 'Search with image',
                  onPressed: () {
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
                                padding: const EdgeInsets.all(16),
                                child: TextButton(
                                  child: const Text('Gallery'),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    controller.searchWithGallery();
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: TextButton(
                                  child: const Text('Camera'),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                    controller.searchWithCamera();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
                const SizedBox(width: 8)
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => Expanded(
                child: controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: true,
                        controller: controller.refreshController,
                        onLoading: controller.onLoadMore,
                        onRefresh: controller.onRefresh,
                        header: const WaterDropHeader(),
                        child: ListView.builder(
                            controller: controller.scrollController,
                            itemCount: controller.foods.length,
                            itemBuilder: (_, index) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: FoodCard(
                                    food: controller.foods[index],
                                  ),
                                )),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
