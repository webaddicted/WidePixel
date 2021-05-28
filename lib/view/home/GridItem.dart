import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

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
    // if(heigthWidth == ApiConstant.Circle_100){
    //    height = 100;
    //    width = 100;
    //    data = categoryBean();
    // }else if(heigthWidth == ApiConstant.Circle_Color_50){
    //   height = 50;
    //   width = 50;
    //   data = colorCategoryBean();
    // }
    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        getStaggered(
            height: 150,
            crossAxisCount: 2,
            itemCount: 6,
            widget: (context, index) {
              var item = data[index];

              return Container(
                  margin: EdgeInsets.all(2),
                  height: 50,
                  child: getCacheImage(url: item.url, height: 50));
            }),
      ],
    );
  }

  Widget getView(double height, double width) {
    return Container(
      height: height,
      margin: EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          getCacheImage(url: data[5].url, height: height, width: width / 2),
          SizedBox(width: 3),
          Column(
            children: [
              getCacheImage(
                  url: data[1].url, height: (height / 2) - 2, width: width / 2),
              SizedBox(height: 3),
              getCacheImage(
                  url: data[3].url, height: (height / 2) - 2, width: width / 2),
            ],
          ),
        ],
      ),
      // Positioned.fill(
      //     child: Material(
      //         color: Colors.transparent,
      //         child: InkWell(
      //             splashColor: ColorConst.SPLASH_COLOR, onTap: () {}))),
    );
  }
}
