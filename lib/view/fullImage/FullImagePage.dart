import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DummyData.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';

class FullImagePage extends GetView<HomeController> {
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
        getImageView(),
        toolbar(),
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
          ],
        )
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
          minScale: PhotoViewComputedScale.contained * 1.2,
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
