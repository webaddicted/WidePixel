import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HorizontalListItem extends StatelessWidget {
  String title;

  List<Results>? data = [];

  HorizontalListItem({required this.title});

  HomeController _homeController = Get.find();
  double height = 220;
  double width = 155;

  @override
  Widget build(BuildContext context) {
    if (title == StrConst.TITLE_GIRLS || title == StrConst.TITLE_GIRLS_DRESS) {
      height = 220;
      width = 155;
    } else if (title == StrConst.TITLE_CAR) {
      height = 100;
      width = Get.width / 1.7;
    } else if (title == StrConst.TITLE_ROBOTIC) {
      height = 170;
      width = Get.width / 1.2;
      // data = colorCategoryBean();
    }
    callApi();
    return Column(
      children: [
        getHeading(title: title, onClick: (String title) {}),
        Obx(() {
          ApiResponse<SearchPhotoRespo?> respo = getRespo();
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!.results;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data != null && data!.length > 0
                ? getViewList()
                : noDataFound();
          } else
            return apiHandler(response: respo);
        })
      ],
    );
  }

  Widget getViewList() {
    return getList(
        height: height,
        itemCount: data!.length,
        widget: (context, index) => getView(
            index: index,
            height: height,
            width: width,
            onClick: () => Get.toNamed(RoutersConst.list)));
  }

  Widget getView(
      {int index = 0, double height = 0, double width = 0, Function? onClick}) {
    Results item = data![index];
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              child: Stack(
                children: [
                  getCacheImage(url: item.urls!.regular!),
                  Positioned.fill(
                      child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                              splashColor: ColorConst.SPLASH_COLOR,
                              onTap: () {
                                onClick!();
                              }))),
                ],
              ),
              borderRadius: BorderRadius.circular(5),
            )));
  }

  void callApi() {
    // SearchPicReq req = SearchPicReq(page: 1);/**/
    if (title == StrConst.TITLE_GIRLS_DRESS) {
      _homeController.girlDressPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    }else if (title == StrConst.TITLE_GIRLS_DRESS) {
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else if (title == StrConst.TITLE_CAR) {
      _homeController.carPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else if (title == StrConst.TITLE_ROBOTIC) {
      _homeController.robotPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else {
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    }
  }

  getRespo() {
    if (title == StrConst.TITLE_GIRLS_DRESS) {
      return _homeController.girlDressRespo.value;
    }else if (title == StrConst.TITLE_GIRLS) {
      return _homeController.girlRespo.value;
    } else if (title == StrConst.TITLE_CAR) {
      return _homeController.carRespo.value;
    } else if (title == StrConst.TITLE_ROBOTIC) {
      return _homeController.robotRespo.value;
    } else {
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    }
  }
}
