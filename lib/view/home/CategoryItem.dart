import 'package:flutter/material.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = 200;
    double width = 155;
    return getList(
            height: height,
            itemCount: categoryBean().length,
            widget: (context, index) => getView(index, height, width)
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
                          splashColor: ColorConst.SPLASH_COLOR, onTap: () {}))),
            ],
          ),
          borderRadius: BorderRadius.circular(5),
        )
      )
    );
  }
}
