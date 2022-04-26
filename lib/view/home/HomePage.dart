import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/data/bean/search/SearchPicReq.dart';
import 'package:widepixelimage/data/controller/HomeController.dart';
import 'package:widepixelimage/utils/common/WidgetHelper.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/DimenSize.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';
import 'package:widepixelimage/view/home/BannerImgItem.dart';
import 'package:widepixelimage/view/home/CategoryTagItem.dart';
import 'package:widepixelimage/view/home/CategoryWithImgItem.dart';
import 'package:widepixelimage/view/home/CircleCategoryItem.dart';
import 'package:widepixelimage/view/home/HorizontalListItem.dart';
import 'package:widepixelimage/view/home/LargeSmallItem.dart';
import 'package:widepixelimage/view/list/PhotoListItem.dart';
import 'package:widepixelimage/view/profile/ProfilePage.dart';
import 'package:widepixelimage/view/profile/TextStyles.dart';
import 'package:widepixelimage/view/search/SearchPage.dart';

class HomePage extends GetView<HomeController> {
  final _selectedIndex = 0.obs;
  static final List<Widget> _widgetOptions = <Widget>[
    // GridItem(ApiConstant.Rect_220_155),
    PhotoListItem(title: 'Nature'),
    PhotoListItem(title: 'Animal'),
    PhotoListItem(title: 'Life'),
    ProfilePage(),
  ];
  final HomeController _homeController = Get.find();

   HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // _homeController.photoOrder();
    return Scaffold(
        bottomNavigationBar: getBottomBar(),
        backgroundColor: ColorConst.WHITE_COLOR,
        // body: showBottomItem()
        body: createUi());
  }

  Widget createUi() {
    // return CustomScrollView(
    //   // controller: _scrollController,
    //   physics: const BouncingScrollPhysics(),
    //   slivers: <Widget>[
    //     toolbar(),
    //     SliverList(
    //         delegate: SliverChildListDelegate(
    //           [
    //         BannerImgItem(title: StringConst.TITLE_TECHNOLOGY),
    //         const SizedBox(height: 10),
    //         CircleCategoryItem(title: StringConst.TITLE_COLOR),
    //         const SizedBox(height: 10),
    //         CategoryTagItem(),
    //         const SizedBox(height: 10),
    //         LargeSmallItem(title: StringConst.TITLE_POPULAR),
    //         const SizedBox(height: 10),
    //         CategoryWithImgItem(),
    //         const SizedBox(height: 10),
    //         HorizontalListItem(title: StringConst.TITLE_GIRLS),
    //         const SizedBox(height: 10),
    //         GridItem(title: StringConst.TITLE_NATURE),
    //         const SizedBox(height: 10),
    //         HorizontalListItem(title: StringConst.TITLE_GIRLS_DRESS),
    //         const SizedBox(height: 10),
    //         HorizontalListItem(title: StringConst.TITLE_CAR),
    //         const SizedBox(height: 10),
    //         CircleCategoryItem(title: StringConst.TITLE_LIFESTYLE),
    //         const SizedBox(height: 10),
    //         HorizontalListItem(title: StringConst.TITLE_ROBOTIC),
    //         const SizedBox(height: 80),
    //       ],
    //          
    //     ))
    //   ],
    // );

    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            toolbar(),
            BannerImgItem(title: StringConst.TITLE_TECHNOLOGY),
            const SizedBox(height: 10),
            CircleCategoryItem(title: StringConst.TITLE_COLOR),
            const SizedBox(height: 10),
            CategoryTagItem(),
            const SizedBox(height: 10),
            LargeSmallItem(title: StringConst.TITLE_POPULAR),
            const SizedBox(height: 10),
            CategoryWithImgItem(),
            const SizedBox(height: 10),
            HorizontalListItem(title: StringConst.TITLE_GIRLS),
            const SizedBox(height: 10),
            // GridItem(title: StringConst.TITLE_NATURE),
            // const SizedBox(height: 10),
            HorizontalListItem(title: StringConst.TITLE_GIRLS_DRESS),
            const SizedBox(height: 10),
            HorizontalListItem(title: StringConst.TITLE_CAR),
            const SizedBox(height: 10),
            CircleCategoryItem(title: StringConst.TITLE_LIFESTYLE),
            const SizedBox(height: 10),
            HorizontalListItem(title: StringConst.TITLE_ROBOTIC),
            const SizedBox(height: 80),
          ],
        ));
  }

  Widget toolbar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.sort,
          color: Colors.black,
        ),
        onPressed: () {
          Get.toNamed(RoutersConst.profile);
        },
      ),
      title: getTxtBlackColor(
          msg: StringConst.APP_NAME,
          fontSize: DimenSize.page_title,
          fontWeight: FontWeight.bold),

      centerTitle: true,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.search,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () async {
              await showSearch<int>(
                context: Get.context!,
                delegate: SearchItem(),
              );
            }),
        IconButton(
            icon: const Icon(
              Icons.notifications_none_outlined,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {
              SearchPicReq req =
                  SearchPicReq(query: StringConst.TITLE_GIRLS_DRESS, page: 1);
              _homeController.girlDressPic(req: req);
              // _homeController.photoOrder();
            }),
      ],
      elevation: 50,
      backgroundColor: Colors.white,
      // expandedHeight: Get.height - 50,
      // snap: false,
      // pinned: false,
      // flexibleSpace: FlexibleSpaceBar(
      //   background: Container(
      //     decoration: const BoxDecoration(color: Colors.transparent),
      //   ),
      // ),
    );
  }

  Widget getBottomBar() {
    return BottomNavigationBar(
      backgroundColor: ColorConst.WHITE_COLOR,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          // title: Text('Order'),
          label: 'Order',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.snowshoeing),
          // title: Text('Go Out'),
          label: 'Go Out',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.category),
          // title: Text('Gold'),
          label: 'Gold',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wifi),
          label: 'Explore',
          // title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          // title: Text('Profile'),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex.value,
      selectedItemColor: ColorConst.BLACK_COLOR,
      unselectedItemColor: ColorConst.GREY_SHADE,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        _selectedIndex.value = index;
        showSnackbar(title: "$index", isSuccess: true);
      },
    );
  }

  Widget showBottomItem() {
    return _selectedIndex.value == 2 || _selectedIndex.value == 4
        ? Container(
            child: _widgetOptions.elementAt(_selectedIndex.value)) : Container(
            color: ColorConst.WHITE_COLOR,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 15.0, right: 10),
                        child: Icon(
                          Icons.location_pin,
                          size: 35,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              'Home',
                              textAlign: TextAlign.left,
                              style: TextStyles.actionTitle,
                            ),
                            Text(
                              'MG Road Bangalore',
                              textAlign: TextAlign.left,
                              style: TextStyles.subText,
                            ),
                            Divider(
                              color: ColorConst.BLACK_COLOR,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.payment,
                        color: ColorConst.BLACK_COLOR,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                // SearchBar('Search for restaurants, Cussines...'),
                _widgetOptions.elementAt(_selectedIndex.value),
              ],
            ),
          );
  }
}
