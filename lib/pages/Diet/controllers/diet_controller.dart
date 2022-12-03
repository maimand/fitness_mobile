import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/repositories/diet_repository.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DietController extends GetxController {
  final DietRepository repository;
  final LogService logService;
  final ImagePicker _picker = ImagePicker();

  DietController(this.repository, this.logService);

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
    if (foods.length < total) {
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

  void logFood(Food food) {
    final log =
        FoodLog(food.id ?? '', food.name ?? '', 1, food.calo?.toInt() ?? 0);
    try {
      logService.logFood(log);
      Get.snackbar('Success', 'Added to your diet today');

    } on Exception catch (e) {
      Get.snackbar('Log Error', e.toString());
    }
  }

  void searchWithCamera() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    if (pickedFile == null) {
      return;
    }
    try {
      repository.predictFood(pickedFile.path);
    } on Exception catch (e) {
      Get.snackbar('Predict Food Failed', e.toString());
    }
  }

  void searchWithGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile == null) {
      return;
    }
    try {
      repository.predictFood(pickedFile.path);
    } on Exception catch (e) {
      Get.snackbar('Predict Food Failed', e.toString());
    }
  }
}