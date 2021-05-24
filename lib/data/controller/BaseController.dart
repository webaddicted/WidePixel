import 'package:get/get.dart';
import 'package:wallpaper/data/repo/BaseRepo.dart';
// import 'package:wallpaper/utils/apiutils/api_response.dart';
import 'package:wallpaper/utils/sp/sp_manager.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  BaseRepo _baseRepo;

  BaseController(this._baseRepo);

  String employeeId = '';

  // final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

  @override
  onInit() {
    super.onInit();
  }

  Future<String> getCustomerId() async {
    if (employeeId.length == 0) employeeId = await SPManager.getCustomerId();
    return employeeId;
  }
}
