import 'package:carousel_slider/carousel_slider.dart';
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

class BannerImgItem extends  GetView<HomeController> {
  String title;
  final _current = 0.obs;

  List<Results>? data = [];

  BannerImgItem({Key? key, required this.title}) : super(key: key);
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    callApi();
    return Column(
      children: [
        Obx(() {
          ApiResponse<SearchPhotoRespo?> respo = _homeController.technologyRespo.value;
          if (respo.status == ApiStatus.COMPLETED) {
            // currentPage++;
            data = respo.data!.results;
            // results.addAll(respo.data!.results!);
            // results = respo.data?.results;
            return data != null && data!.length > 0
                ? carouselViewList()
                : noDataFound();
          } else
            return apiHandler(response: respo);
        }),
        // Obx(() => Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: data!.map((url) {
        //         int index = data!.indexOf(url);
        //         return Container(
        //           width: 8.0,
        //           height: 8.0,
        //           margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        //           decoration: BoxDecoration(
        //             shape: BoxShape.circle,
        //             color: _current == index
        //                 ? Color.fromRGBO(0, 0, 0, 0.9)
        //                 : Color.fromRGBO(0, 0, 0, 0.4),
        //           ),
        //         );
        //       }).toList(),
        //     ))
      ],
    );
  }

  Widget carouselViewList() {
    return CarouselSlider.builder(
      itemCount: data!.length,
      options: CarouselOptions(
          aspectRatio: 2,
//          enlargeCenterPage: true,
          // pauseAutoPlayInFiniteScroll: true
          height: 450,
          scrollDirection: Axis.horizontal,
          autoPlay: true,

          onPageChanged: (index, reason) {
            _current.value = index;
          }),
      itemBuilder: (BuildContext context, int itemIndex, int realIndex) =>
          getSliderItem(
              itemIndex: itemIndex,
              realIndex: realIndex,
              onTap: () {
                Get.toNamed(RoutersConst.detail, arguments: [title,data![itemIndex]]);
              }),
    );
  }

  Widget getSliderItem({int itemIndex = 0, int? realIndex, Function? onTap}) {
    var item = data![itemIndex];
    return Container(
      margin: EdgeInsets.all(1),
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Container(width: Get.width, child: getCacheImage(url: item.urls!.regular!)),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  // child: Text(
                  //   name==null?"":name,
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 20.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                ),
              ),
              Positioned.fill(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: ColorConst.SPLASH_COLOR,
                          onTap: () => onTap!()))),
            ],
          )),
    );
  }
  void callApi() {
    // SearchPicReq req = SearchPicReq(page: 1);/**/
    _homeController.technologyPic(
        req: SearchPicReq(page: 1, query: title),
        isFreshCall: false);
  }

}
