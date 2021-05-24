import 'package:get/get.dart';
import 'package:wallpaper/data/repo/HomeRepo.dart';
// import 'package:wallpaper/utils/apiutils/api_response.dart';
import 'package:wallpaper/utils/sp/sp_manager.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  HomeRepo _homeRepo;
  HomeController(this._homeRepo);
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
