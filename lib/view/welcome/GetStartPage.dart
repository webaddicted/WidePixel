import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/controller/WelcomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/AssetsConst.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';

class GetStartPage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        getCacheImage(assetPath: AssetsConst.GET_START_BG_IMG),
        Container(color: Colors.black26),
        Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black54]))),
        Container(
          height: 40,
          margin: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            onPressed: () => Get.offAllNamed(RoutersConst.home),
            color: ColorConst.LIGHT_GREEN_COLOR,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: getTxtWhiteColor(
                msg: "GET STARTED",
                fontWeight: FontWeight.w700,
                fontSize: 13.0,
              ),
            )),
          ),
        ),
      ],
    ));
  }
}
