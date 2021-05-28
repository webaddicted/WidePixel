import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class BannerImgItem extends StatelessWidget {
  String heigthWidth;

  BannerImgItem(this.heigthWidth);

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
      width = Get.width ;
      data = colorCategoryBean();
    }

    return Column(
      children: [
        getHeading(title: heigthWidth, onClick: (String title) {}),
        CarouselSlider.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
              getSliderItem(
                  itemIndex: itemIndex, realIndex: realIndex, onTap: () {}),
          options: CarouselOptions(
            aspectRatio: 2.0,
//          enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
        )
      ],
    );
  }

  Widget getSliderItem({int itemIndex = 0, int? realIndex, Function? onTap}) {
    var item = data[itemIndex];
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Container(width: Get.width, child: getCacheImage(url: item.url)),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  // child: Text(
                  //   name==null?"":name,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorConst.SPLASH_COLOR,
                          onTap: () => onTap!()))),
            ],
          )),
    );
  }
}
