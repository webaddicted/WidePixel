import 'package:widepixelimage/data/repo/BaseRepo.dart';

class WelcomeRepo extends BaseRepo{

  allCity(String employeeId) async {
    var map = <String, String>{};
    map['employee_id'] = employeeId;
    map['device_id'] = 'await deviceId()';
    // final response =
    //     await apiHelper.post(url: "${ApiConstant.ABOUT_US}", params: map);

    // return ApiResponse.returnResponse(
    //     response,
    //     response.data == null
    //         ? null
    //         : UpdateProfileReq.fromJson(jsonDecode(response.toString())));
  }
}
