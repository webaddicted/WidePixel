import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DimenSize.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';
import 'package:wallpaper/view/list/PhotoListItem.dart';

class ListPage extends GetView<HomeController> {
  String title = 'Nature';

  // ListPage({required this.title});
  @override
  Widget build(BuildContext context) {
    var argu = Get.arguments;
    title = argu[0];
    return Scaffold(backgroundColor: ColorConst.WHITE_COLOR, body: createUi());
  }

  Widget createUi() {
    return CustomScrollView(
      slivers: <Widget>[
        toolbar(),
        SliverList(
            delegate: SliverChildListDelegate(
          [PhotoListItem(title: title)],
        ))
      ],
    );
  }

  Widget toolbar() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      title: getTxtBlackColor(
          msg: title,
          fontSize: DimenSize.page_title,
          fontWeight: FontWeight.bold),

      centerTitle: true,
      actions: [
        //   IconButton(
        //       icon: Icon(
        //         Icons.search_rounded,
        //         color: ColorConst.BLACK_COLOR,
        //       ),
        //       onPressed: () {}),
        PopupMenuButton<int>(
          // key: _key,
          icon: Icon(
            Icons.view_quilt_sharp,
            color: ColorConst.BLACK_COLOR,
          ),
          itemBuilder: (context) {
            return <PopupMenuEntry<int>>[
              PopupMenuItem(
                  child: getTxtBlackColor(msg: 'Staggered view'), value: 0),
              PopupMenuItem(child: getTxtBlackColor(msg: 'Vertical'), value: 1),
              PopupMenuItem(child: getTxtBlackColor(msg: 'Gide (2)'), value: 2),
              PopupMenuItem(child: getTxtBlackColor(msg: 'Gide (3)'), value: 3),
              // PopupMenuItem(child: getTxtBlackColor(msg: 'Download'), value: 4),
              // PopupMenuItem(child: getTxtBlackColor(msg: 'Download'), value: 5),
            ];
          },
          onSelected: (index) {
            switch (index) {
              case 0:
                {
                  // _homeController.girlDressPic(
                  //     req: req);
                  showSnackbar(
                      title: StrConst.APP_NAME,
                      subTitle: 'wallpaper',
                      isSuccess: true);
                  break;
                }
              default:
                break;
            }
          },
        )
      ],
      elevation: 50,
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
  }
}
