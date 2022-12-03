import 'package:fitness_mobile/data/providers/auth_provider.dart';
import 'package:fitness_mobile/data/providers/program_provider.dart';
import 'package:fitness_mobile/data/repositories/auth_repository.dart';
import 'package:fitness_mobile/data/repositories/exercise_repository.dart';
import 'package:fitness_mobile/pages/Welcome/welcome_screen.dart';
import 'package:fitness_mobile/services/auth_service.dart';
import 'package:fitness_mobile/services/network_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NetWorkService());
  Get.put(AuthProvider(Get.find<NetWorkService>()));
  Get.put(ProgramProvider(Get.find<NetWorkService>()));
  Get.put(AuthRepository(Get.find<AuthProvider>()));
  Get.put(ExerciseRepository(Get.find<ProgramProvider>()));
  Get.put(AuthService(Get.find<AuthRepository>()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'fitness_mobile Trainer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
