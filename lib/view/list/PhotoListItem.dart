import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
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
  int totalPages = 1;
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
        if (currentPage <= totalPages) callApi();
      }
    });
    callApi();
    return Obx(() {
      var respo = _homeController.searchPhotoRespo.value;
      if (respo.status == ApiStatus.COMPLETED) {
        currentPage++;
        totalPages = respo.data!.totalPages!;
        results.addAll(respo.data!.results!);
        // results = respo.data?.results;
        return results != null && results.length > 0
            ? getList()
            : noDataFound();
      } else
        return apiHandler(response: respo);
    });
  }

  Widget getList() {
    return Scrollbar(
      controller: ScrollController(),
      child: getStaggered(
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
          }),
    );
  }

  void callApi() {
    SearchPicReq req = SearchPicReq(query: query, page: currentPage);
    if (apiName == ApiConstant.SEARCH_PHOTOS) {
      _homeController.searchPic(
          req: req, isFreshCall: results.length > 0 ? false : true);
    } else {
      _homeController.searchPic(
          req: req, isFreshCall: results.length > 0 ? false : true);
    }
  }
}
