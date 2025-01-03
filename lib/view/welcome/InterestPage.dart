import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/controller/WelcomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ApiConstant.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';

class InterestedPage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createUi());
  }

  Widget _createUi() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(height: 50),
        InkWell(
          onTap: () => Get.toNamed(RoutersConst.get_start),
          child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 10),
              child: getTxtBlackColor(
                  msg: StringConst.skip,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 10),
        getTxtColor(
            msg: StringConst.choose_topic,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            txtColor: ColorConst.LIGHT_GREEN_COLOR),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
          child: getTxtBlackColor(
              msg: StringConst.choose_topic_desc,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: interestList.length,
          padding: const EdgeInsets.only(top: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3 / 1,
          ),
          itemBuilder: (context, index) {
            InterestedPageList categ = interestList[index];
            return Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      getCacheImage(url: categ.imgUrl),
                      // Center(
                      //   child: Lottie.asset(
                      //     AssetsConst.CHECK_DONE_IMG,
                      //     repeat: false,
                      //     reverse: false,
                      //     animate: true,
                      //   ),
                      // ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 20.0),
                          alignment: Alignment.center,
                          child: getTxtWhiteColor(
                              msg: categ.heading,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ),
        InkWell(
          onTap: () => Get.toNamed(RoutersConst.home),
          child: Container(
            margin: const EdgeInsets.all(8),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(27.0),
              ),
              onPressed: () => Get.offAllNamed(RoutersConst.get_start),
              color: ColorConst.LIGHT_GREEN_COLOR,
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                child: getTxtWhiteColor(
                  msg: "Done",
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              )),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

  final interestList = [
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Fashion"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Nature"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Backgrounds"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "science"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Education"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "People"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Feelings"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Religion"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Health"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Places"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Animals"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Industry"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Food"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Computer"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Sports"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Transportation"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Travel"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Buildings"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Business"),
    InterestedPageList(imgUrl: ApiConstant.DEMO_IMG, heading: "Music")
  ];
}

class InterestedPageList {
  final String imgUrl;
  final String heading;

  InterestedPageList({required this.imgUrl, required this.heading});
}
