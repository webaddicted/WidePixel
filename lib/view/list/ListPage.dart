import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DimenSize.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/view/list/PhotoListItem.dart';

class ListPage extends GetView<HomeController> {
  String pageTitle = 'Nature';

  @override
  Widget build(BuildContext context) {
    // var argu = Get.arguments;
    // pageTitle = argu[0];
    return Scaffold(backgroundColor: ColorConst.WHITE_COLOR, body: createUi());
  }

  Widget createUi() {
    return CustomScrollView(
      slivers: <Widget>[
        toobar(),
        SliverList(
            delegate: SliverChildListDelegate(
          [PhotoListItem('Nature')],
        ))
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
            Get.back();
          },
        ),
      ),
      title: getTxtBlackColor(
          msg: pageTitle,
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
        IconButton(
            icon: Icon(
              Icons.more_vert_rounded,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {

            }),
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

  Widget categoryTag() {
    return Container(
        margin: EdgeInsets.only(left: 5),
        child: getList(
            height: 60,
            itemCount: categoryBean().length,
            widget: (context, index) {
              CategoryBean item = categoryBean()[index];
              return Container(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: getTxtBlackColor(msg: '${item.name}')),
                  ),
                ),
              );
            }));
  }

  Widget categoryWithImg() {
    return getList(
        height: 60,
        itemCount: categoryBean().length,
        widget: (context, index) {
          CategoryBean item = categoryBean()[index];
          return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: 8, left: 8),
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
