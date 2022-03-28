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

class CategoryTagItem extends GetView<HomeController> {
  String apiName;
  String title;

  CategoryTagItem({this.title = '', this.apiName = ''});
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
    return categoryTag();
  }
  Widget categoryTag() {
    return Container(
        margin: const EdgeInsets.only(left: 5),
        child: getList(
            height: 60,
            itemCount: categoryBean().length,
            widget: (context, index) {
              CategoryBean item = categoryBean()[index];
              return InkWell(
                onTap: () => Get.toNamed(RoutersConst.list, arguments: [item.name]),
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: getTxtBlackColor(msg: '${item.name}')),
                    ),
                  ),
                ),
              );
            }));
  }
}
