import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/PhotoOrderRespo.dart';
import 'package:widepixelimage/data/bean/SearchPhotoRespo.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/repo/HomeRepo.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';

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
    try {
      img3ComboRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.photoOrder(req: req);
    img3ComboRespo.value = data;
  }

  photoOrder({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      photoOrderRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.photoOrder(req: req);
    photoOrderRespo.value = data;
  }

  searchPic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      searchPhotoRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    searchPhotoRespo.value = data;
  }

  naturePic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      natureRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    natureRespo.value = data;
  }

  girlPic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      girlRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    girlRespo.value = data;
  }

  carPic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      carRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    carRespo.value = data;
  }

  robotPic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      robotRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    robotRespo.value = data;
  }

  technologyPic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      technologyRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    technologyRespo.value = data;
  }

  lifeStylePic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      lifeStyleRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    lifeStyleRespo.value = data;
  }

  moviePic({required SearchPicReq req, bool isFreshCall = true}) async {
    try {
      movieRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    final data = await _homeRepo.searchPhoto(req: req);
    movieRespo.value = data;
  }

  girlDressPic({required SearchPicReq req, bool isFreshCall = true}) async {
    var respoData = girlDressRespo.value.data;
    print('object  :  girlDressRespo');
    try {
      girlDressRespo.value = ApiResponse.loading();
    } catch (exp) {
      print('test error : ${exp.toString()}');
    }
    print('object  :  girlDressRespo125');
    final data = await _homeRepo.searchPhoto(req: req);
    print('object  :  girlDressRespo129');
    girlDressRespo.value = data;
  }
}
