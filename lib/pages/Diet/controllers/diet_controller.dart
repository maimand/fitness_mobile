import 'package:fitness_mobile/data/models/diet.model.dart';
import 'package:fitness_mobile/data/repositories/diet_repository.dart';
import 'package:fitness_mobile/pages/Diet/food_predict_result.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:fitness_mobile/utils/dialog_utils.dart';
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
  RxBool isLoading = true.obs;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    getFood(showLoading: true);
    super.onInit();
  }

  Future<void> getFood({bool showLoading = false}) async {
    if(showLoading) {
      isLoading.value = true;
    }
    try {
      final res = await repository.getFoods(
          name: searchController.text.trim(), page: currentPage);
      total = res.total ?? 0;
      currentPage = res.page ?? 1;
      foods.addAll(res.items ?? []);
    } on Exception catch (e) {
      Get.snackbar('Get Food Failed', e.toString());
    } finally {
      if(showLoading) {
        isLoading.value = false;
      }
    }
  }

  void onLoadMore() async {
    if (foods.length < total) {
      refreshController.requestLoading();
      currentPage++;
      await getFood();
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
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
    onRefresh();
  }

  void logFood(Food food, int number) {
    try {
      logService.logFood(food, number);
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

    predict(pickedFile);
  }


  void searchWithGallery() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    predict(pickedFile);
  }

  void predict(XFile? pickedFile) async {
    if (pickedFile == null) {
      return;
    }
    try {
      showLoading();
      final res = await repository.predictFood(pickedFile.path);
      final r = await repository.getFoods(name: res.trim());
      Get.to(() => PredictResultView(
        food: r.items ?? [],
        foodName: res,
      ));
    } on Exception catch (e) {
      Get.snackbar('Predict Food Failed', e.toString());
    } finally {
      hideLoading();
    }
  }

}
