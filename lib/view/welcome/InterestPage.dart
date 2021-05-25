import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper/data/controller/WelcomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/AssetsConst.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

class InterestedPage extends GetView<WelcomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createUi());
  }

  Widget _createUi() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(height: 80),
          getTxtColor(
              msg: StrConst.choose_topic,
              fontSize: 18,
              txtColor: ColorConst.LIGHT_GREEN_COLOR),
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: interestList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3 / 1,
            ),
            itemBuilder: (context, index) {
              InterestedPageList categ = interestList[index];
              return Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                      children: <Widget>[
                  getCacheImage(url: categ.imgUrl),
                        Lottie.asset(
                          AssetsConst.CHECK_DONE_IMG,
                          repeat: false,
                          reverse: false,
                          animate: true,
                        ),
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
                      padding: EdgeInsets.symmetric(
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
              return InkWell(
              onTap: ()=> Get.toNamed(RoutersConst.home),
              child: Card(
              elevation: 3,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              ),
              // color: categ.bgColor,
              child: Center(
              child: Stack(
              children: <Widget>[
              getCacheImage(url: categ.imgUrl),
              Lottie.asset(
              AssetsConst.CHECK_DONE_IMG,
              repeat: false,
              reverse: false,
              animate: true,
              ),
              Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 5),
              child: getTxtWhiteColor(
              msg: categ.heading,
              fontSize: 14,
              fontWeight: FontWeight.w600),
              )
              ],
              ),
              ),
              )
              ,
              );
            },
          ),
        ]),
      ),
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
