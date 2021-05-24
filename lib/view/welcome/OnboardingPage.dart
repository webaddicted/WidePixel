import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/AssetsConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';
import 'package:wallpaper/view/widgethelper/SlideDots.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(body: SliderLayout());

  bool inFinalPage() {
    if (_currentPage == sliderArrayList.length - 1) {
      return true;
    }
    return false;
  }

  Widget SliderLayout() => Container(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: sliderArrayList.length,
                itemBuilder: (ctx, i) => pageWidget(i),
              ),
            ),
            Container(
                alignment: AlignmentDirectional.bottomCenter,
                margin: EdgeInsets.only(bottom: 10, top: 50),
                child: inFinalPage()
                    ? getStartBtn()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 25.0, top: Get.width * 0.12),
                child: getTxtBlackColor(
                  msg: inFinalPage() ? "" : 'SKIP',
                  fontWeight: FontWeight.w700,
                  fontSize: 13.0,
                ),
              ),
            ),
          ],
        ),
      );

  Widget pageWidget(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Container(
            width: Get.width,
            height: Get.height * 0.556,
            child: SvgPicture.asset(
              sliderArrayList[index].sliderImageUrl,
              width: Get.width,
            ),
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           fit: BoxFit.fill,
            //           image:AssetImage(sliderArrayList[index].sliderImageUrl))),
            // ),
          ),
        ),
        SizedBox(height: 20),
        getTxtColor(
          msg: sliderArrayList[index].sliderHeading,
          fontWeight: FontWeight.w600,
          txtColor: Color(0xff01dc9d),
          fontSize: 18.0,
        ),
        SizedBox(height: 10),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: getTxtBlackColor(
              msg: sliderArrayList[index].sliderSubHeading,
              fontWeight: FontWeight.w600,
              fontSize: 12.0,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget getStartBtn() {
    return Container(
      height: 45.0,
      width: 140.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(27.0),
        ),
        onPressed: () {
          Get.offAllNamed(RoutersConst.interest_page);
        },
        color: Color(0xff01dc9d),
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: getTxtWhiteColor(
            msg: "GET STARTED",
            fontWeight: FontWeight.w700,
            fontSize: 13.0,
          ),
        )),
      ),
    );
  }
}

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
  final String skipBtn;

  Slider(
      {required this.sliderImageUrl,
      required this.sliderHeading,
      required this.sliderSubHeading,
      this.skipBtn = ''});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: AssetsConst.SLIDER1,
      sliderHeading: 'Watch Wallpaper',
      sliderSubHeading: StrConst.DUMMY_TXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER2,
      sliderHeading: 'Share Wallpaper',
      sliderSubHeading: StrConst.DUMMY_TXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER3,
      sliderHeading: 'Download Wallpaper',
      sliderSubHeading: StrConst.DUMMY_TXT,
      skipBtn: ""),
];
