import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class PhotoListItem extends StatelessWidget {
  PhotoListItem({this.title});

  String? title;
  HomeController _homeController = Get.find();
  ScrollController _scrollController = new ScrollController();
  int currentPage = 1;
  int totalPages = 1;
  List<Results> data = [];

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      debugPrint(
          "pixels : ${_scrollController.position
              .pixels}  \n maxScrollExtent : ${_scrollController.position
              .maxScrollExtent}");
      if (_scrollController.position.pixels > 0 &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        if (currentPage <= totalPages) callApi();
      }
    });
    print('title 1 :  $title');
    callApi();
    // return Container();
    return Obx(() {
      var respo = getRespo();
      if (respo.status == ApiStatus.COMPLETED) {
        currentPage++;
        totalPages = respo.data!.totalPages!;
        data.addAll(respo.data!.results!);
        // results = respo.data?.results;
        return data.length > 0 ? getList() : noDataFound();
      } else
        return apiHandler(response: respo);
    });
  }

  Widget getList() {
    return
      // SingleChildScrollView(
      //   controller: _scrollController,
      //   child: Scrollbar(
      //
      //   child:


        getStaggered(
            height: 280,
            crossAxisCount: 2,
            itemCount: data.length,
            controller: _scrollController,
            widget: (context, index) {
              var item = data[index];
              return Container(
                margin: EdgeInsets.all(2),
                child: ClipRRect(
                  child: Stack(
                    children: [
                      getCacheImage(url: item.urls!.small.toString()),
                      Positioned.fill(
                          child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  splashColor: ColorConst.SPLASH_COLOR,
                                  onTap: () =>
                                      Get.toNamed(RoutersConst.detail,
                                          arguments: [title, item])))),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              );
            });
    // ),
      // );
  }

  void callApi() {
    SearchPicReq req = SearchPicReq(query: title, page: currentPage);
    if (title == StrConst.TITLE_GIRLS) {
      _homeController.girlPic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else if (title == StrConst.TITLE_NATURE) {
      _homeController.naturePic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else if (title == StrConst.TITLE_GIRLS_DRESS) {
      _homeController.girlDressPic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else if (title == StrConst.TITLE_CAR) {
      _homeController.carPic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else if (title == StrConst.TITLE_LIFESTYLE) {
      _homeController.lifeStylePic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else if (title == StrConst.TITLE_ROBOTIC) {
      _homeController.robotPic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    } else {
      _homeController.searchPic(
          req: req, isFreshCall: data.length > 0 ? false : true);
    }
  }

  getRespo() {
    if (title == StrConst.TITLE_GIRLS) {
      return _homeController.girlRespo.value;
    } else if (title == StrConst.TITLE_NATURE) {
      return _homeController.natureRespo.value;
      // } else if (title == StrConst.TITLE_NATURE) {
      //   return _homeController.natureRespo.value;
    } else if (title == StrConst.TITLE_GIRLS_DRESS) {
      return _homeController.girlDressRespo.value;
    } else if (title == StrConst.TITLE_CAR) {
      return _homeController.carRespo.value;
    } else if (title == StrConst.TITLE_LIFESTYLE) {
      return _homeController.lifeStyleRespo.value;
    } else if (title == StrConst.TITLE_ROBOTIC) {
      return _homeController.robotRespo.value;
    }
    // else if (title == StrConst.TITLE_NATURE) {
    //   return _homeController.natureRespo.value;
    // }

    else {
      return _homeController.searchPhotoRespo.value;
    }
  }
}
