import 'package:get/get.dart';
import 'package:wallpaper/data/bean/PhotoOrderRespo.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
import 'package:wallpaper/data/repo/HomeRepo.dart';
import 'package:wallpaper/utils/api_response.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  HomeRepo _homeRepo;

  HomeController(this._homeRepo);

  final img3ComboRespo = (ApiResponse<List<PhotoOrderRespo>?>()).obs;
  final photoOrderRespo = (ApiResponse<List<PhotoOrderRespo>?>()).obs;
  final searchPhotoRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final natureRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final girlRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final carRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final robotRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final girlDressRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final technologyRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final movieRespo = (ApiResponse<SearchPhotoRespo?>()).obs;
  final lifeStyleRespo = (ApiResponse<SearchPhotoRespo?>()).obs;

  img3Combo({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) img3ComboRespo.value = ApiResponse.loading();
    final data = await _homeRepo.photoOrder(req: req);
    img3ComboRespo.value = data;
  }

  photoOrder({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) photoOrderRespo.value = ApiResponse.loading();
    final data = await _homeRepo.photoOrder(req: req);
    photoOrderRespo.value = data;
  }

  searchPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) searchPhotoRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    searchPhotoRespo.value = data;
  }

  naturePic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) natureRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    natureRespo.value = data;
  }

  girlPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) girlRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    girlRespo.value = data;
  }

  carPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) carRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    carRespo.value = data;
  }

  robotPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) robotRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    robotRespo.value = data;
  }

  technologyPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) technologyRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    technologyRespo.value = data;
  }
  lifeStylePic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) lifeStyleRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    lifeStyleRespo.value = data;
  }
  moviePic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) movieRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    movieRespo.value = data;
  }
  girlDressPic({required SearchPicReq req, bool isFreshCall = true}) async {
    if (isFreshCall) girlDressRespo.value = ApiResponse.loading();
    final data = await _homeRepo.searchPhoto(req: req);
    girlDressRespo.value = data;
  }
}
