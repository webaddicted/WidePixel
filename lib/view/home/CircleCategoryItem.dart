import 'package:flutter/material.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/utils/common/GlobalUtilities.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

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
    if(heigthWidth == ApiConstant.Circle_100){
       height = 100;
       width = 100;
       data = categoryBean();
    }else if(heigthWidth == ApiConstant.Circle_Color_50){
      height = 80;
      width = 80;
      data = colorCategoryBean();
    }

    return getList(
        height: height,
        itemCount: data.length,
        widget: (context, index) => getView(index, height, width));
  }

  Widget getView(int index, double height, double width) {
    CategoryBean item = data[index];
    return Container(
        margin: EdgeInsets.only(left: 5, right: 5),
        child: ClipRRect(
          child: Stack(
            children: [
              if (heigthWidth == ApiConstant.Circle_Color_50)
                Container(
                  width: width,
                  height: height,
                  // decoration:  BoxDecoration(color: Colors.transparent),
                  color: Colors.yellow,
                ),
                // getCacheImage(
                //   colorPath: colorFromHex(item.color!),
                //   isCircle: true,
                //   height: height,
                //   width: width),
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
                          splashColor: ColorConst.SPLASH_COLOR, onTap: () {}))),
            ],
          ),
        ));
  }
}
