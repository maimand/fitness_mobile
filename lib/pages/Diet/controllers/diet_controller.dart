import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/repositories/diet_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DietController extends GetxController {
  final DietRepository repository;

  DietController(this.repository);

  RxList<Food> foods = <Food>[].obs;
  int currentPage = 1;
  int total = 0;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getFood();
    super.onInit();
  }

  Future<void> getFood() async {
    try {
      final res = await repository.getFoods(
          name: searchController.text.trim(), page: currentPage);
      total = res.total ?? 0;
      currentPage = res.page ?? 1;
      foods.addAll(res.items ?? []);
    } on Exception catch (e) {
      Get.snackbar('Get Food Failed', e.toString());
    }
  }

  void onLoadMore() async {
    if(foods.length < total) {
      currentPage++;
      await getFood();
      refreshController.loadComplete();
    }

  }

  void onRefresh() async {
    currentPage = 1;
    foods.clear();
    await getFood();
    refreshController.refreshCompleted();
  }

  void onClear() {
    searchController.clear();
    onRefresh();
    update();
  }

  void onChange() async {
    searchController.clear();
    await Future.delayed(const Duration(seconds: 2));
    onRefresh();
  }
}
