import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/AssetsConst.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';
import 'package:widepixelimage/view/widgethelper/SlideDots.dart';

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

  Widget SliderLayout() => Stack(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 50),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: sliderArrayList.length,
          itemBuilder: (ctx, i) => pageWidget(i),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left:10, right: 20, bottom: 15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if(!inFinalPage())
            InkWell(
              onTap: ()=>Get.offAllNamed(RoutersConst.interest_page),
              child: getTxtBlackColor(
                msg:'SKIP',
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
              ),
            ),
            Container(
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
            if(!inFinalPage())
            FloatingActionButton(
              backgroundColor: ColorConst.WHITE_COLOR,
              child: Icon(
                Icons.arrow_forward,
                color: ColorConst.APP_COLOR,
              ),
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ),
          ],
        ),
      )
    ],
  );

  Widget pageWidget(int index) {
    Slider slider = sliderArrayList[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: Get.width,
          height: Get.height * 0.556,
          child: SvgPicture.asset(
            slider.sliderImageUrl,
            width: Get.width,
          ),
          //   decoration: BoxDecoration(
          //       image: DecorationImage(
          //           fit: BoxFit.fill,
          //           image:AssetImage(sliderArrayList[index].sliderImageUrl))),
          // ),
        ),
        const SizedBox(height: 20),
        getTxtColor(
          msg: slider.sliderHeading,
          fontWeight: FontWeight.w600,
          txtColor: ColorConst.APP_COLOR,
          fontSize: 19.0,
        ),
        const SizedBox(height: 10),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: getTxtBlackColor(
              msg: slider.sliderSubHeading,
              fontSize: 15.0,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget getStartBtn() {
    return Expanded(
      child: SizedBox(
        height: 45.0,
        width: 140.0,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(27.0),
          ),
          onPressed: () =>Get.offAllNamed(RoutersConst.interest_page),
          color: ColorConst.LIGHT_GREEN_COLOR,
          child: Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: getTxtWhiteColor(
              msg: "GET STARTED",
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
            ),
          )),
        ),
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
      sliderImageUrl: AssetsConst.SLIDER2,
      sliderHeading: 'Share widepixelimage',
      sliderSubHeading: StringConst.DUMMY_TXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER1,
      sliderHeading: 'Watch widepixelimage',
      sliderSubHeading: StringConst.DUMMY_TXT,
      skipBtn: 'SKIP'),
  Slider(
      sliderImageUrl: AssetsConst.SLIDER3,
      sliderHeading: 'Download widepixelimage',
      sliderSubHeading: StringConst.DUMMY_TXT,
      skipBtn: ""),
];
