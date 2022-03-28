import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:widepixelimage/data/bean/SearchPhotoRespo.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ApiConstant.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';

class DetailPage extends GetView<HomeController> {
  String title = 'Nature';
  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  late PageController pageController;
  int index = 0;
  Results? data;

  @override
  Widget build(BuildContext context) {
    pageController = PageController(initialPage: index);
    var argu = Get.arguments;
    print('Details: $argu');
    title = argu[0];
    data = argu[1];

    return Scaffold(body: createUi());
  }

  Widget createUi() {
    return Stack(
      children: [
    InkWell(
        onTap: () =>
            Get.toNamed(RoutersConst.fullimage, arguments: [title, data]),
        child: getCacheImage(url: data!.urls!.regular!, fit: BoxFit.cover)),
    toolbar(),
    slidingUp()
      ],
    );
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
                  Get.toNamed(RoutersConst.preview, arguments: [title, data]);
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
                      child: getTxtBlackColor(msg: 'Set as widepixelimage'),
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
                          title: StringConst.APP_NAME,
                          subTitle: 'widepixelimage',
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
        padding: const EdgeInsets.all(0),
        panelBuilder: (sc) => _panel(sc),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return MediaQuery.removePadding(
      context: Get.context!,
      removeTop: true,
      child: ListView(controller: sc, children: <Widget>[
        const SizedBox(height: 15),
        Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(12.0))),
          ),
        ),
        const SizedBox(height: 18.0),
        InkWell(
          onTap: () {},
          child: Row(
            children: <Widget>[
              const SizedBox(width: 8),
              getCacheImage(
                  url: ApiConstant.DEMO_IMG,
                  height: 50,
                  width: 50,
                  isCircle: true),
              const SizedBox(width: 8),
              getTxtBlackColor(
                  msg: StringConst.APP_NAME,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              const Spacer(),
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
        const SizedBox(
          height: 36.0,
        ),
      ]),
    );
  }

  Widget getImageView() {
    return Container();
//     return Container(
//         child: PhotoViewGallery.builder(
//       scrollPhysics: const BouncingScrollPhysics(),
//       builder: (BuildContext context, int indexss) {
//         String imgurl = categoryBean()[1].url;
//         return PhotoViewGalleryPageOptions(
//           imageProvider: CachedNetworkImageProvider(imgurl),
//           minScale: PhotoViewComputedScale.contained * 0.8,
//           maxScale: PhotoViewComputedScale.covered * 2,
//           // heroAttributes: PhotoViewHeroAttributes(tag: tag),
//         );
//       },
//       itemCount: 1,
//       loadingBuilder: (context, event) => Center(
//         child: Container(
//           width: 20.0,
//           height: 20.0,
//           child: CircularProgressIndicator(
//             value: event == null
//                 ? 0
//                 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
//           ),
//         ),
//       ),
//       pageController: pageController,
// //      onPageChanged: onPageChanged,
//       enableRotation: true,
// //      reverse: true,
//     ));
  }
}
