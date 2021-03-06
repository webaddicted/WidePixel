import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/PhotoOrderRespo.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class LargeSmallItem extends GetView<HomeController> {
  String title;

  List<PhotoOrderRespo> data = [];

  LargeSmallItem({required this.title});

  final HomeController _homeController = Get.find();

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
          var respo = _homeController.img3ComboRespo.value;
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data.isNotEmpty
                ? getView(height, width)
                : noDataFound();
          } else {
            return apiHandler(response: respo);
          }
        })
        // getView(height, width)
      ],
    );
  }

  Widget getView(double height, double width) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          InkWell(
              onTap: () =>
                  Get.toNamed(RoutersConst.detail, arguments: [title, data[0]]),
              child: getCacheImage(
                  url: data[0].urls!.regular!,
                  height: height,
                  width: width / 2)),
          const SizedBox(width: 3),
          Column(
            children: [
              InkWell(
                onTap: () => Get.toNamed(RoutersConst.detail,
                    arguments: [title, data[1]]),
                child: getCacheImage(
                    url: data[1].urls!.regular!,
                    height: (height / 2) - 2,
                    width: width / 2),
              ),
              const SizedBox(height: 3),
              InkWell(
                onTap: () => Get.toNamed(RoutersConst.detail,
                    arguments: [title, data[2]]),
                child: getCacheImage(
                    url: data[2].urls!.regular!,
                    height: (height / 2) - 2,
                    width: width / 2),
              ),
            ],
          ),
        ],
      ),
      // Positioned.fill(
      //     child: Material(
      //         color: Colors.transparent,
      //         child: InkWell(
      //             splashColor: ColorConst.SPLASH_COLOR, onTap: () {}))),
    );
  }

  void callApi() {
    // SearchPicReq req = SearchPicReq(page: 1);/**/
    _homeController.img3Combo(req: SearchPicReq(page: 1), isFreshCall: false);
  }
}
