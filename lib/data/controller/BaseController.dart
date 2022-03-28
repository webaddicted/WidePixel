import 'package:get/get.dart';
import 'package:widepixelimage/data/repo/BaseRepo.dart';
import 'package:widepixelimage/utils/sp/sp_manager.dart';

class BaseController extends GetxController {
  static BaseController get to => Get.find();
  BaseRepo _baseRepo;

  BaseController(this._baseRepo);

  String employeeId = '';

  // final allCityRespo = (ApiResponse<UpdateProfileReq>()).obs;

  Future<String> getCustomerId() async {
    if (employeeId.isEmpty) employeeId = await SPManager.getCustomerId();
    return employeeId;
  }
}
