import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/SearchPhotoRespo.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HorizontalListItem extends StatelessWidget {
  HorizontalListItem({required this.title});

  String title;
  List<Results>? data = [];
  final HomeController _homeController = Get.find();
  double height = 220;
  double width = 155;

  @override
  Widget build(BuildContext context) {
    if (title == StringConst.TITLE_GIRLS || title == StringConst.TITLE_GIRLS_DRESS) {
      height = 220;
      width = 155;
    } else if (title == StringConst.TITLE_CAR) {
      height = 100;
      width = Get.width / 1.7;
    } else if (title == StringConst.TITLE_ROBOTIC) {
      height = 170;
      width = Get.width / 1.2;
      // data = colorCategoryBean();
    }
    callApi();
    return Column(
      children: [
        getHeading(
            title: title,
            onClick: (String title) =>
                Get.toNamed(RoutersConst.list, arguments: [title])),
        Obx(() {
          var respo = getRespo();
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!.results;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data != null && data!.isNotEmpty
                ? getViewList()
                : noDataFound();
          } else {
            return apiHandler(response: respo);
          }
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
            onClick: () {
              print('Send argu');
              Get.toNamed(RoutersConst.detail,
                arguments: [title, data![index]]);}));
  }

  Widget getView(
      {int index = 0, double height = 0, double width = 0, Function? onClick}) {
    Results item = data![index];
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
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
    if (title == StringConst.TITLE_GIRLS_DRESS) {
      _homeController.girlDressPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else if (title == StringConst.TITLE_GIRLS) {
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else if (title == StringConst.TITLE_CAR) {
      _homeController.carPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else if (title == StringConst.TITLE_ROBOTIC) {
      _homeController.robotPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    } else {
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    }
  }

  getRespo() {
    if (title == StringConst.TITLE_GIRLS_DRESS) {
      return _homeController.girlDressRespo.value;
    } else if (title == StringConst.TITLE_GIRLS) {
      return _homeController.girlRespo.value;
    } else if (title == StringConst.TITLE_CAR) {
      return _homeController.carRespo.value;
    } else if (title == StringConst.TITLE_ROBOTIC) {
      return _homeController.robotRespo.value;
    } else {
      return _homeController.girlRespo.value;
      _homeController.girlPic(
          req: SearchPicReq(query: title, page: 1), isFreshCall: false);
    }
  }
}
