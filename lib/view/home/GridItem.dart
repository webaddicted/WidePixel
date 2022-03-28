import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/SearchPhotoRespo.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class GridItem extends StatelessWidget {
  String title = '';

  GridItem({required this.title});

  final HomeController _homeController = Get.find();
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
                Get.toNamed(RoutersConst.list, arguments: [title])),
        Obx(() {
          var respo = _homeController.natureRespo.value;
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!.results;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data != null && data!.isNotEmpty ? getList() : noDataFound();
          } else {
            return apiHandler(response: respo);
          }
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
            onTap: () =>
                Get.toNamed(RoutersConst.detail, arguments: [title, item]),
            splashColor: ColorConst.SPLASH_COLOR,
            child: Container(
                margin: const EdgeInsets.all(2),
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
