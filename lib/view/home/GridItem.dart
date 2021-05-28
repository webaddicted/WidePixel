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

class GridItem extends StatelessWidget {
  String heigthWidth;

  GridItem(this.heigthWidth);

  var data = colorCategoryBean();

  @override
  Widget build(BuildContext context) {
    double height = 350;
    double width = Get.width - 15;
    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        getStaggered(
            height: 150,
            crossAxisCount: 2,
            itemCount: 6,
            widget: (context, index) {
              var item = data[index];

              return InkWell(
                onTap: ()=>Get.toNamed(RoutersConst.list),
                splashColor: ColorConst.SPLASH_COLOR,
                child: Container(
                    margin: EdgeInsets.all(2),
                    height: 50,
                    child: getCacheImage(url: item.url, height: 50)),
              );
            }),
      ],
    );
  }

}
