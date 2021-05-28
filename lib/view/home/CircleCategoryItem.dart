import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/utils/common/GlobalUtilities.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CircleCategoryItem extends StatelessWidget {
  String heigthWidth;

  CircleCategoryItem(this.heigthWidth);

  var data = categoryBean();

  @override
  Widget build(BuildContext context) {
    double height = 100;
    double width = 100;
    if (heigthWidth == ApiConstant.Circle_100) {
      height = 100;
      width = 100;
      data = categoryBean();
    } else if (heigthWidth == ApiConstant.Circle_Color_50) {
      height = 50;
      width = 50;
      data = colorCategoryBean();
    }
    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        getList(
            height: height,
            itemCount: data.length,
            widget: (context, index) =>
                getView(index: index,
                    height: height,
                    width: width,
                    onClick: () => Get.toNamed(RoutersConst.list)
                )),
      ],
    );
  }

  Widget getView(
      {int index = 0, double height = 50, double width = 50, Function? onClick}) {
    CategoryBean item = data[index];
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: ClipRRect(
          child: Stack(
            children: [
              if (heigthWidth == ApiConstant.Circle_Color_50)
                getCacheImage(
                    colorPath: colorFromHex(item.color!),
                    isCircle: true,
                    height: height,
                    width: width),
              if (heigthWidth == ApiConstant.Circle_100)
                getCacheImage(
                    url: item.url,
                    isCircle: true,
                    height: height,
                    width: width),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorConst.SPLASH_COLOR, onTap: () {
                        onClick!();
                      }))),
            ],
          ),
        ));
  }


}
