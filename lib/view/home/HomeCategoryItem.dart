import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HomeCategoryItem extends StatelessWidget {
  String heigthWidth;

  HomeCategoryItem(this.heigthWidth);

  var data = categoryBean();

  @override
  Widget build(BuildContext context) {
    double height = 220;
    double width = 155;
    if (heigthWidth == ApiConstant.Rect_220_155) {
      height = 220;
      width = 155;
    } else if (heigthWidth == ApiConstant.Rect_100_15) {
      height = 100;
      width = Get.width / 1.7;
    } else if (heigthWidth == ApiConstant.Rect_320_15) {
      height = 170;
      width = Get.width / 1.2;
      data = colorCategoryBean();
    }

    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        getList(
            height: height,
            itemCount: data.length,
            widget: (context, index) => getView(
                index: index,
                height: height,
                width: width,
                onClick: () => Get.toNamed(RoutersConst.list)))
      ],
    );
  }

  Widget getView(
      {int index = 0, double height = 0, double width = 0, Function? onClick}) {
    CategoryBean item = data[index];
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              child: Stack(
                children: [
                  getCacheImage(url: item.url),
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
}
