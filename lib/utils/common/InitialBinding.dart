import 'package:get/get.dart';
import 'package:widepixelimage/data/controller/BaseController.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/data/controller/WelcomeController.dart';
import 'package:widepixelimage/data/repo/BaseRepo.dart';
import 'package:widepixelimage/data/repo/HomeRepo.dart';
import 'package:widepixelimage/data/repo/WelcomeRepo.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseController(BaseRepo()), fenix: true);
    Get.lazyPut(() => WelcomeController(WelcomeRepo()), fenix: true);
    Get.lazyPut(() => HomeController(HomeRepo()), fenix: true);

  }
}
