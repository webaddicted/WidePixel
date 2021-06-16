import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/bean/SearchPhotoRespo.dart';
import 'package:wallpaper/data/bean/search/SearchPicReq.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/api_response.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class GridItem extends GetView<HomeController> {
  String title = '';

  GridItem({required this.title});

  HomeController _homeController = Get.find();
  List<Results>? data = [];

  @override
  Widget build(BuildContext context) {
    double height = 350;
    double width = Get.width - 15;
    callApi();
    return Column(
      children: [
        getHeading(
            title: title,
            onClick: (String title) =>
                Get.toNamed(RoutersConst.list, arguments: [title])
        ),
        Obx(() {
          var respo = _homeController.natureRespo.value;
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!.results;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data != null && data!.length > 0 ? getList() : noDataFound();
          } else
            return apiHandler(response: respo);
        })
      ],
    );
  }

  Widget getList() {
    return getStaggered(
        height: 150,
        crossAxisCount: 2,
        itemCount: 6,
        widget: (context, index) {
          Results item = data![index];
          return InkWell(
            onTap: () => Get.toNamed(RoutersConst.list),
            splashColor: ColorConst.SPLASH_COLOR,
            child: Container(
                margin: EdgeInsets.all(2),
                height: 50,
                child: getCacheImage(url: item.urls!.regular!, height: 50)),
          );
        });
  }

  void callApi() {
    // SearchPicReq req = SearchPicReq(page: 1);/**/
    _homeController.naturePic(
        req: SearchPicReq(page: 1, perPage: 6, query: title),
        isFreshCall: false);
  }
}
