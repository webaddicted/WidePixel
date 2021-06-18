import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';

class PreviewPage extends GetView<HomeController> {
  int index = 0;
  String title = 'Nature';
  Results? data;
  @override
  Widget build(BuildContext context) {
    var argu = Get.arguments;
    title = argu[0];
    data = argu[1];
    return Scaffold(body: createUi());
  }

  Widget createUi() {
    return Container(
        child: Stack(
      children: [
        InkWell(
            splashColor: ColorConst.SPLASH_COLOR,
            child: getCacheImage(url: data!.urls!.regular!, fit: BoxFit.fill)),
        toolbar(),
        Center(child: getTime())
      ],
    ));
  }

  Widget toolbar() {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConst.GREY_SHADE,
          ),
          onPressed: () => Get.back(),
        ),
        // Row(
        //   children: [
        //     IconButton(
        //         icon: Icon(
        //           Icons.help_outline_sharp,
        //           color: ColorConst.GREY_SHADE,
        //         ),
        //         onPressed: () {}),
        //   ],
        // )
      ]),
    );
  }

  Widget getTime() {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MMMM-yyyy');
    String formattedDate = formatter.format(now);
    String formattedTime = DateFormat('hh:mm').format(now);
    // String formattedTime = DateFormat('hh:mm a').format(now);

    return Column(children: [
      SizedBox(height: 120),
      getTxtWhiteColor(
          msg: formattedTime, fontSize: 78, fontWeight: FontWeight.w700),
      getTxtWhiteColor(
          msg: formattedDate, fontSize: 18, fontWeight: FontWeight.w700)
    ]);
  }
}
