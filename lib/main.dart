import 'package:fitness_mobile/data/providers/auth_provider.dart';
import 'package:fitness_mobile/data/providers/diet_provider.dart';
import 'package:fitness_mobile/data/providers/log_provider.dart';
import 'package:fitness_mobile/data/providers/program_provider.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:fitness_mobile/data/repositories/diet_repository.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:fitness_mobile/data/repositories/log_repository.dart';
import 'package:fitness_mobile/pages/Welcome/welcome_screen.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:fitness_mobile/services/log_service.dart';
import 'package:fitness_mobile/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  Get.put(NetWorkService());
  Get.put(AuthProvider(Get.find<NetWorkService>()));
  Get.put(ProgramProvider(Get.find<NetWorkService>()));
  Get.put(DietProvider(Get.find<NetWorkService>()));
  Get.put(LogProvider(Get.find<NetWorkService>()));
  Get.put(AuthRepository(Get.find<AuthProvider>()));
  Get.put(ExerciseRepository(Get.find<ProgramProvider>()));
  Get.put(DietRepository(Get.find<DietProvider>()));
  Get.put(LogRepository(Get.find<LogProvider>()));
  Get.put(AuthService(Get.find<AuthRepository>()));
  Get.put(
      LogService(Get.find<LogRepository>(), Get.find<ExerciseRepository>()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Smart Refresher under the global configuration subtree, here are a few particularly important attributes
    return RefreshConfiguration(
      headerBuilder: () =>
          const WaterDropHeader(), // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
      footerBuilder: () =>
          const ClassicFooter(), // Configure default bottom indicator
      headerTriggerDistance: 80.0, // header trigger refresh trigger distance
      springDescription: const SpringDescription(
          stiffness: 170,
          damping: 16,
          mass:
              1.9), // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent:
          100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed:
          true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull:
          false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // trigger load more by BallisticScrollActivity
      child: GetMaterialApp(
        title: 'fitness_mobile Trainer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
