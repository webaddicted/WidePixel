import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ApiConstant.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';

class DetailPage extends GetView<HomeController> {
  String pageTitle = 'Nature';
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  late PageController pageController;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    pageController = PageController(initialPage: index);
    // var argu = Get.arguments;
    // pageTitle = argu[0];
    return Scaffold(body: createUi());
  }

  Widget createUi() {
    return Container(
        child: Stack(
      children: [
        InkWell(
            onTap: () => Get.toNamed(RoutersConst.fullimage),
            child: getCacheImage(url: categoryBean()[1].url, fit: BoxFit.fill)),
        toolbar(),
        slidingUp()
      ],
    ));
  }

  Widget toolbar() {
    return SafeArea(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConst.GREY_SHADE,
          ),
          onPressed: () => Get.back(),
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.help_outline_sharp,
                  color: ColorConst.GREY_SHADE,
                ),
                onPressed: () {
                  Get.toNamed(RoutersConst.preview);
                }),
            PopupMenuButton<int>(
              // key: _key,
              icon: Icon(
                Icons.more_vert_rounded,
                color: ColorConst.GREY_SHADE,
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry<int>>[
                  PopupMenuItem(
                      child: getTxtBlackColor(msg: 'Set as wallpaper'),
                      value: 0),
                  PopupMenuItem(
                      child: getTxtBlackColor(msg: 'Download'), value: 1),
                  PopupMenuItem(
                      child: getTxtBlackColor(msg: 'Share'), value: 2),
                  PopupMenuItem(
                      child: getTxtBlackColor(msg: 'Preview'), value: 3),
                  // PopupMenuItem(child: getTxtBlackColor(msg: 'Download'), value: 4),
                  // PopupMenuItem(child: getTxtBlackColor(msg: 'Download'), value: 5),
                ];
              },
              onSelected: (index) {
                switch (index) {
                  case 0:
                    {
                      showSnackbar(
                          title: StrConst.APP_NAME,
                          subTitle: 'wallpaper',
                          isSuccess: true);
                      break;
                    }
                  default:
                    break;
                }
              },
            )
          ],
        )
      ]),
    );
  }

  Widget slidingUp() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: SlidingUpPanel(
        // backdropEnabled: true,
        minHeight: Get.height / 20,
        maxHeight: Get.height * .33,
        parallaxEnabled: false,
        // parallaxOffset: .5,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        padding: EdgeInsets.all(0),
        panelBuilder: (sc) => _panel(sc),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
      context: Get.context!,
      removeTop: true,
      child: ListView(controller: sc, children: <Widget>[
        SizedBox(height: 15),
        Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
          ),
        ),
        SizedBox(height: 18.0),
        InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              SizedBox(width: 8),
              getCacheImage(
                  url: ApiConstant.DEMO_IMG,
                  height: 50,
                  width: 50,
                  isCircle: true),
              SizedBox(width: 8),
              getTxtBlackColor(
                  msg: StrConst.APP_NAME,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: getTxtGreyColor(
                    msg: '28 May 2021',
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 36.0,
        ),
      ]),
    );
  }

  Widget getImageView() {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: const BouncingScrollPhysics(),
      builder: (BuildContext context, int indexss) {
        String imgurl = categoryBean()[1].url;
        return PhotoViewGalleryPageOptions(
          imageProvider: CachedNetworkImageProvider(imgurl),
          minScale: PhotoViewComputedScale.contained * 0.8,
          maxScale: PhotoViewComputedScale.covered * 2,
          // heroAttributes: PhotoViewHeroAttributes(tag: tag),
        );
      },
      itemCount: 1,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
          ),
        ),
      ),
      pageController: pageController,
//      onPageChanged: onPageChanged,
      enableRotation: true,
//      reverse: true,
    ));
  }
}
