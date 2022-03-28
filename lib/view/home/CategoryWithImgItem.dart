import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/CategoryBean.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ApiConstant.dart';
import 'package:widepixelimage/utils/constant/DummyData.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class CategoryWithImgItem extends GetView<HomeController> {
  String apiName;
  String title;

  CategoryWithImgItem({this.title = '', this.apiName = ''});
  var data = categoryBean();
  @override
  Widget build(BuildContext context) {
    double height = 100;
    double width = 100;
    if (apiName == ApiConstant.COLOR_IMAGE) {
      height = 100;
      width = 100;
      data = categoryBean();
    } else if (apiName == ApiConstant.Circle_Color_50) {
      height = 50;
      width = 50;
      data = colorCategoryBean();
    }
    return categoryWithImg();
  }
  Widget categoryWithImg() {
    return getList(
        height: 60,
        itemCount: categoryBean().length,
        widget: (context, index) {
          CategoryBean item = categoryBean()[index];
          return InkWell(
            onTap: () => Get.toNamed(RoutersConst.list, arguments: [item.name]),
            child: Container(
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: getCacheImage(
                          url: item.url,
                          height: 50,
                          width: 100,
                          fit: BoxFit.cover)),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                      height: 50,
                      width: 100,
                      alignment: Alignment.center,
                      child: getTxtWhiteColor(
                        msg: item.name ?? "Yo Yo",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ))
                ],
              ),
            ),
          );
        });
  }
}
