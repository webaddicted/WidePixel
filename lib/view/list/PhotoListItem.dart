import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class PhotoListItem extends StatelessWidget {
  String? apiName;
  String? query;

  PhotoListItem({this.apiName, this.query});

  HomeController _homeController = Get.find();
  var data = colorCategoryBean();
  int currentPage = 1;
  int total_pages = 1;
  List<Results> results = [];
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() {
      // debugPrint(
      //     "pixels : ${_scrollController.position
      //         .pixels}  \n maxScrollExtent : ${_scrollController.position
      //         .maxScrollExtent}");
      if (_scrollController.position.pixels > 0 &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        if (currentPage <= total_pages) callApi();
        // callMovieApi(apiName, model, movieId: movieId, page: pageSize);
      }
    });
    callApi();
    return Obx(() {
      var respo = _homeController.searchPhotoRespo.value;
      if (respo.status == ApiStatus.COMPLETED) {
        currentPage++;
        total_pages = respo.data!.totalPages!;
        results.addAll(respo.data!.results!);
        // results = respo.data?.results;
        return results != null && results.length > 0
            ? getList()
            : noDataFound();
      } else
        return apiHandler(response: respo);
    });

    // return results == null
    //     ? getStaggered(
    //         height: 280,
    //         crossAxisCount: 2,
    //         itemCount: data.length,
    //         widget: (context, index) {
    //           var item = data[index];
    //           return Container(
    //             margin: EdgeInsets.all(2),
    //             child: ClipRRect(
    //               child: Stack(
    //                 children: [
    //                   getCacheImage(url: item.url),
    //                   Positioned.fill(
    //                       child: Material(
    //                           color: Colors.transparent,
    //                           child: InkWell(
    //                               splashColor: ColorConst.SPLASH_COLOR,
    //                               onTap: () =>
    //                                   Get.toNamed(RoutersConst.detail)))),
    //                 ],
    //               ),
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //           );
    //         })
    //     : getStaggered(
    //         height: 280,
    //         crossAxisCount: 2,
    //         itemCount: results!.length,
    //         widget: (context, index) {
    //           var item = results![index];
    //           return Container(
    //             margin: EdgeInsets.all(2),
    //             child: ClipRRect(
    //               child: Stack(
    //                 children: [
    //                   getCacheImage(url: item.urls!.regular.toString()),
    //                   Positioned.fill(
    //                       child: Material(
    //                           color: Colors.transparent,
    //                           child: InkWell(
    //                               splashColor: ColorConst.SPLASH_COLOR,
    //                               onTap: () =>
    //                                   Get.toNamed(RoutersConst.detail)))),
    //                 ],
    //               ),
    //               borderRadius: BorderRadius.circular(5),
    //             ),
    //           );
    //         });
  }

  Widget getList() {
    return getStaggered(
        height: 280,
        crossAxisCount: 2,
        itemCount: results.length,
        controller: _scrollController,
        widget: (context, index) {
          var item = results[index];
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
                              onTap: () => Get.toNamed(RoutersConst.detail)))),
                ],
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          );
        });
  }

  void callApi() {
    if (apiName == ApiConstant.SEARCH_PHOTOS) {
      _homeController.searchPic(
          query: query!,
          currentPage: currentPage,
          isFreshCall: results.length > 0 ? false : true);
    } else {
      _homeController.searchPic(
          query: query!,
          currentPage: currentPage,
          isFreshCall: results.length > 0 ? false : true);
    }
  }
}
