import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.WHITE_COLOR,
        body: SafeArea(child: createUi()));
  }

  Widget createUi() {
    return CustomScrollView(
      slivers: <Widget>[
        toobar(),
        // _contentSection(data),
      ],
    );
  }

  Widget toobar() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
          },
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // expandedHeight: Get.height - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
    // return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    //   IconButton(
    //       icon: Icon(
    //         Icons.sort, //menu,//dehaze,
    //         color: ColorConst.BLACK_COLOR,
    //       ),
    //       onPressed: () {
    //         // _scaffoldKey.currentState.openDrawer();
    //       }),
    //   getTxtAppColor(
    //       msg: StrConst.APP_NAME, fontSize: 18, fontWeight: FontWeight.bold),
    // ]);
  }
}
