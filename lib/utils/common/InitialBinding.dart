import 'package:get/get.dart';
import 'package:wallpaper/data/controller/BaseController.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/data/controller/WelcomeController.dart';
import 'package:wallpaper/data/repo/BaseRepo.dart';
import 'package:wallpaper/data/repo/HomeRepo.dart';
import 'package:wallpaper/data/repo/WelcomeRepo.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => WelcomeController(WelcomeRepo()), fenix: true);
    Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);

  }
}
