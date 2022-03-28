import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/CategoryBean.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/DimenSize.dart';
import 'package:widepixelimage/utils/constant/DummyData.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';
import 'package:widepixelimage/view/search/SearchPage.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class HomePageUi extends StatelessWidget {
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return createUi();
  }
  Widget createUi() {
    return CustomScrollView(
      slivers: <Widget>[
        toobar(),
        SliverList(
            delegate: SliverChildListDelegate(
              [
                // CircleCategoryItem(apiName: ApiConstant.Circle_Color_50),
                // SizedBox(height: 10),
                // categoryTag(),
                // SizedBox(height: 10),
                // LargeSmallItem(ApiConstant.Rect_100_15),
                // SizedBox(height: 10),
                // categoryWithImg(),
                // SizedBox(height: 10),
                // GridItem(ApiConstant.Rect_220_155),
                // SizedBox(height: 10),
                // HomeCategoryItem(ApiConstant.Rect_220_155),
                // SizedBox(height: 10),
                // CircleCategoryItem(apiName: ApiConstant.Circle_100),
                // SizedBox(height: 10),
                // HomeCategoryItem(ApiConstant.Rect_100_15),
                // SizedBox(height: 10),
                // HomeCategoryItem(ApiConstant.Rect_320_15),
                // SizedBox(height: 10),
                // BannerImgItem(ApiConstant.Rect_320_15)
              ],
            ))
      ],
    );
  }
  Widget toobar() {
    return SliverAppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.sort,
          color: Colors.black,
        ),
        onPressed: () {
          Get.toNamed(RoutersConst.profile);
        },
      ),
      title: getTxtBlackColor(
          msg: StringConst.APP_NAME,
          fontSize: DimenSize.page_title,
          fontWeight: FontWeight.bold),

      centerTitle: true,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.search,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () async {
              await showSearch<int>(
                context: Get.context!,
                delegate: SearchItem(),
              );
            }),
        IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {
              // _homeController.photoOrder();
            }),
      ],
      elevation: 50,
      backgroundColor: Colors.transparent,
      // expandedHeight: Get.height - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
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
                // onTap: () => Get.toNamed(RoutersConst.list),
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

  Widget categoryWithImg() {
    return getList(
        height: 60,
        itemCount: categoryBean().length,
        widget: (context, index) {
          CategoryBean item = categoryBean()[index];
          return InkWell(
            onTap: () => Get.toNamed(RoutersConst.list),
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