import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/CategoryBean.dart';
import 'package:widepixelimage/data/bean/SearchPhotoRespo.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';
import 'package:widepixelimage/utils/common/GlobalUtilities.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/DummyData.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CircleCategoryItem extends StatelessWidget {
  String title = '';

  CircleCategoryItem({required this.title});

  HomeController _homeController = Get.find();
  double height = 100;
  double width = 100;
  var data = [];

  @override
  Widget build(BuildContext context) {
    if (title == StringConst.TITLE_COLOR) {
      height = 50;
      width = 50;
    } else {
      height = 100;
      width = 100;
    }
    callApi();
    return getListView();
  }

  Widget getListView() {
    if (title == StringConst.TITLE_COLOR) {
      return Column(
        children: [
          getList(
              height: height,
              itemCount: data.length,
              widget: (context, index) => getView(
                  index: index,
                  height: height,
                  width: width,
                  onClick: () =>
          Get.toNamed(RoutersConst.list, arguments: [data[index].name])),
          )
        ],
      );
    } else {
      return Column(
        children: [
          getHeading(
              title: title,
              onClick: (String title) {
                  Get.toNamed(RoutersConst.list, arguments: [title]);
              }),
          Obx(() {
            ApiResponse<SearchPhotoRespo?> respo =
                _homeController.lifeStyleRespo.value;
            if (respo.status == ApiStatus.COMPLETED) {
              data = respo.data!.results!;
              return data.isNotEmpty
                  ? getList(
                      height: height,
                      itemCount: data.length,
                      widget: (context, index) => getView(
                          index: index,
                          height: height,
                          width: width,
                          onClick: () {
                            Get.toNamed(RoutersConst.detail, arguments: [title,data[index]]);
                          }))
                  : noDataFound();
            } else {
              return apiHandler(response: respo);
            }
          })
        ],
      );
    }
  }

  Widget getView(
      {int index = 0,
      double height = 50,
      double width = 50,
      Function? onClick}) {
    var item;
    if (title == StringConst.TITLE_COLOR) {
      item = data[index] as CategoryBean;
    } else {
      item = data[index] as Results;
    }
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        child: ClipRRect(
          child: Stack(
            children: [
              if (title == StringConst.TITLE_COLOR)
                getCacheImage(
                    colorPath: colorFromHex(item!.color!),
                    isCircle: true,
                    height: height,
                    width: width),
              if (title != StringConst.TITLE_COLOR)
                getCacheImage(
                    url: item!.urls!.regular!,
                    isCircle: true,
                    height: height,
                    width: width),
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
        ));
  }

  void callApi() {
    if (title == StringConst.TITLE_COLOR) {
      data = colorCategoryBean();
    } else {
      _homeController.lifeStylePic(req: SearchPicReq(query: title, page: 1));
    }
  }
}
