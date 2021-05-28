import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HomeCategoryItem extends StatelessWidget {
  String heigthWidth;

  HomeCategoryItem(this.heigthWidth);

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
    }

    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        getList(
            height: height,
            itemCount: categoryBean().length,
            widget: (context, index) => getView(index, height, width))
      ],
    );
  }

  Widget getView(int index, double height, double width) {
    CategoryBean item = categoryBean()[index];
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
                              onTap: () {}))),
                ],
              ),
              borderRadius: BorderRadius.circular(5),
            )));
  }
}
