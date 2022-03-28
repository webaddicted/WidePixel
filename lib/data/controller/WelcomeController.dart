import 'package:get/get.dart';
import 'package:widepixelimage/data/repo/WelcomeRepo.dart';

class WelcomeController extends GetxController {
  static WelcomeController get to => Get.find();
  WelcomeRepo _welcomeRepo;

  WelcomeController(this._welcomeRepo);
// final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

// allCity() async {
//   allCityRespo.value = ApiResponse.loading();
//   if (employeeId.isEmpty) employeeId = await getCustomerId();
//   final data = await _homeRepo.allCity(employeeId);
//   allCityRespo.value = data;
//   // print("LoginRespo : ${callLoginRespo}");
//   return data;
// }
}
