import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/InitialBinding.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/RoutesPage.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(AppController());
    return GetMaterialApp(
      title: StrConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutersConst.initialRoute,
      getPages: RoutesPage(),
    );
  }
}
