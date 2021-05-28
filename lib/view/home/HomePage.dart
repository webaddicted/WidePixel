import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/CategoryBean.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DimenSize.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';
import 'package:wallpaper/view/home/BannerImgItem.dart';
import 'package:wallpaper/view/home/CircleCategoryItem.dart';
import 'package:wallpaper/view/home/GridItem.dart';
import 'package:wallpaper/view/home/HomeCategoryItem.dart';
import 'package:wallpaper/view/home/LargeSmallItem.dart';
import 'package:wallpaper/view/search/SearchPage.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.WHITE_COLOR,
        body: createUi());
  }

  Widget createUi() {
    return CustomScrollView(
      slivers: <Widget>[
        toobar(),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            CircleCategoryItem(ApiConstant.Circle_Color_50),
            SizedBox(height: 10),
            categoryTag(),
            SizedBox(height: 10),
            LargeSmallItem(ApiConstant.Rect_100_15),
            SizedBox(height: 10),
            categoryWithImg(),
            SizedBox(height: 10),
            GridItem(ApiConstant.Rect_220_155),
            SizedBox(height: 10),
            HomeCategoryItem(ApiConstant.Rect_220_155),
            SizedBox(height: 10),
            CircleCategoryItem(ApiConstant.Circle_100),
            SizedBox(height: 10),
            HomeCategoryItem(ApiConstant.Rect_100_15),
            SizedBox(height: 10),
            HomeCategoryItem(ApiConstant.Rect_320_15),
            SizedBox(height: 10),
            BannerImgItem(ApiConstant.Rect_320_15)
          ],
        ))
      ],
    );
  }

  Widget toobar() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      title: getTxtBlackColor(
          msg: StrConst.APP_NAME,
          fontSize: DimenSize.page_title,
          fontWeight: FontWeight.bold),

      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
              Icons.search,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () async{
             await showSearch<int>(
                context: Get.context!,
                delegate: SearchItem(),
              );
            }),
        IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {}),
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
              return InkWell(
                onTap: ()=>Get.toNamed(RoutersConst.list),
                child: Container(
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
            onTap: ()=>Get.toNamed(RoutersConst.list),
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
