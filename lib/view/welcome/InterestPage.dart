import 'package:flutter/material.dart';
import 'package:wallpaper/data/controller/WelcomeController.dart';
import 'package:wallpaper/utils/common/GlobalUtilities.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/AssetsConst.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/sp/sp_manager.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
class InterestedPage extends GetView<WelcomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _createUi());
  }

  Widget _createUi() {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: interestList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.3 / 1,
            ),
            itemBuilder: (context, index) {
              String categ = interestList[index];
              return InkWell(
                onTap: () {},
                child: Card(
                  elevation: 3,
                  // color: categ.bgColor,
                  child: Center(
                    child: Stack(
                      children: <Widget>[
                        getCacheImage(url: ApiConstant.DEMO_IMG),
                        Lottie.asset(
                          AssetsConst.CHECK_DONE_IMG,
                          repeat: false,
                          reverse: false,
                          animate: true,
                        ),
                        getTxtBlackColor(
                            msg: categ,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }

    var interestList = ["fashion", "nature", "backgrounds", "science", "education", "people", "feelings", "religion",
  "health", "places", "animals", "industry", "food", "computer", "sports", "transportation", "travel", "buildings", "business", "music"];

}
