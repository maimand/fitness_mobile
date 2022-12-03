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
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.orange, width: 1))),
                    child: TextField(
                      controller: controller.searchController,
                      onChanged: (value) => controller.onChange(),
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
                child: SmartRefresher(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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

// SafeArea(
// child: DefaultTabController(
// length: 4,
// child: Scaffold(
// appBar: AppBar(
// elevation: 0,
// backgroundColor: Colors.white,
// flexibleSpace: Header(
// 'Diet',
// rightSide: Container(
// height: 35.0,
// padding: const EdgeInsets.symmetric(horizontal: 16.0),
// margin: const EdgeInsets.only(right: 20.0),
// decoration: BoxDecoration(
// color: const Color.fromRGBO(100, 140, 255, 1.0),
// borderRadius: BorderRadius.circular(20.0),
// ),
// child: const Center(
// child: Text(
// 'Tracker',
// style: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.w900,
// ),
// ),
// ),
// ),
// ),
// bottom: TabBar(
// tabs: const <Widget>[
// SizedBox(
// height: 30.0,
// child: Tab(
// text: 'Breakfast',
// ),
// ),
// SizedBox(
// height: 30.0,
// child: Tab(
// text: 'Lunch',
// ),
// ),
// SizedBox(
// height: 30.0,
// child: Tab(
// text: 'Dinner',
// ),
// ),
// SizedBox(
// height: 30.0,
// child: Tab(
// text: 'Snacks',
// ),
// ),
// ],
// labelColor: Colors.black87,
// unselectedLabelColor: Colors.grey[400],
// indicatorWeight: 4.0,
// indicatorSize: TabBarIndicatorSize.label,
// indicatorColor: const Color.fromRGBO(215, 225, 255, 1.0),
// ),
// ),
// body: TabBarView(
// children: <Widget>[
// TabViewBase(
// tabName: 'Breakfast',
// ),
// TabViewBase(
// tabName: 'Lunch',
// ),
// TabViewBase(
// tabName: 'Dinner',
// ),
// TabViewBase(
// tabName: 'Snacks',
// ),
// ],
// ),
// ),
// ),
// ),
