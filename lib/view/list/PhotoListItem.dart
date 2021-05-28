import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class PhotoListItem extends StatelessWidget {
  String heigthWidth;

  PhotoListItem(this.heigthWidth);

  var data = colorCategoryBean();

  @override
  Widget build(BuildContext context) {
    return getStaggered(
        height: 280,
        crossAxisCount: 2,
        itemCount: data.length,
        widget: (context, index) {
          var item = data[index];
          return Container(
            margin: EdgeInsets.all(2),
            child: ClipRRect(
              child: Stack(
                children: [
                  getCacheImage(url: item.url),
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
}
