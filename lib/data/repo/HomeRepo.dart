import 'package:flutter/cupertino.dart';
import 'package:wallpaper/data/bean/PhotoOrderRespo.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
import 'package:wallpaper/data/repo/BaseRepo.dart';
import 'package:wallpaper/utils/api_base_helper.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';

class HomeRepo extends BaseRepo {
  // allCity(String employeeId) async {
  //   var map = Map<String, String>();
  //   map['employee_id'] = employeeId;
  //   map['device_id'] = 'await deviceId()';
    // final response =
    //     await apiHelper.post(url: "${ApiConstant.ABOUT_US}", params: map);

    // return ApiResponse.returnResponse(
    //     response,
    //     response.data == null
    //         ? null
    //         : UpdateProfileReq.fromJson(jsonDecode(response.toString())));
  // }

  photoOrder(
      {required SearchPicReq req}) async {
    var map = Map<String, dynamic>();
    map['page'] = req.page.toString();
    map['per_page'] = req.perPage.toString();
    if (req.orderBy != null && req.orderBy.toString().length > 0)
      map['order_by'] = req.orderBy.toString();
    final response =
        await apiHelper.getWithParam(url: "${ApiConstant.PHOTOS}", params: map);
    List<PhotoOrderRespo> photo = [];
    response.data.forEach((v) {
      photo.add(PhotoOrderRespo.fromJson(v));
    });
    return ApiResponse.returnResponse(
        response, response.data == null ? null : photo);
  }

  searchPhoto({required SearchPicReq req}) async {
    var map = Map<String, dynamic>();
    map['page'] = req.page.toString();
    map['per_page'] = req.perPage.toString();
    map['query'] = req.query.toString();
    if (req.orderBy != null && req.orderBy.toString().length > 0)
      map['order_by'] = req.orderBy.toString();
    if (req.color != null && req.color.toString().length > 0)
      map['color'] = req.color.toString();
    if (req.orientation != null && req.orientation.toString().length > 0)
      map['orientation'] = req.orientation.toString();

    final response = await apiHelper.getWithParam(
        url: "${ApiConstant.SEARCH_PHOTOS}", params: map);
    return ApiResponse.returnResponse(
        response,
        response.data == null
            ? null
            : SearchPhotoRespo.fromJson(response.data));
  }
}
