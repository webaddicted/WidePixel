import 'package:get/get.dart';
import 'package:wallpaper/data/bean/PhotoOrderRespo.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/repo/HomeRepo.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  HomeRepo _homeRepo;

  HomeController(this._homeRepo);

  final photoOrderRespo = (ApiResponse<List<PhotoOrderRespo>?>()).obs;
  final searchPhotoRespo = (ApiResponse<SearchPhotoRespo?>()).obs;

  photoOrder(
      {int currentPage = 1, int pageSize = ApiConstant.PAGE_SIZE}) async {
    photoOrderRespo.value = ApiResponse.loading();
    final data = await _homeRepo.photoOrder();
    photoOrderRespo.value = data;
  }

  searchPic(
      {String query = '',
      int currentPage = 1,
      int pageSize = ApiConstant.PAGE_SIZE,
      bool isFreshCall = true}) async {
    if (isFreshCall) searchPhotoRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(
        query: query, page: currentPage, pageSize: pageSize);
    searchPhotoRespo.value = data;
  }
}
