import 'package:wallpaper/data/bean/PhotoOrderRespo.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/repo/BaseRepo.dart';
import 'package:wallpaper/utils/api_base_helper.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';

class HomeRepo extends BaseRepo {
  allCity(String employeeId) async {
    var map = Map<String, String>();
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

  photoOrder(
      {int page = 1, int pageSize = 2, String orderBy = 'latest'}) async {
    var map = Map<String, dynamic>();
    map['page'] = page;
    map['per_page'] = pageSize;
    map['order_by'] = orderBy;
    final response =
        await apiHelper.getWithParam(url: "${ApiConstant.PHOTOS}", params: map);
   List<PhotoOrderRespo> photo = [];
    response.data.forEach((v) {
      photo.add(PhotoOrderRespo.fromJson(v));
    });
    return ApiResponse.returnResponse(response,
        response.data == null ? null : photo);
  }

  searchPhoto(
      {String query = 'Beautiful girl', int page = 1, int pageSize = 2}) async {
    var map = Map<String, dynamic>();
    map['page'] = page;
    map['per_page'] = pageSize;
    map['query'] = query;
    final response = await apiHelper.getWithParam(
        url: "${ApiConstant.SEARCH_PHOTOS}", params: map);
    return ApiResponse.returnResponse(
        response,
        response.data == null
            ? null
            : SearchPhotoRespo.fromJson(response.data));
  }
}
