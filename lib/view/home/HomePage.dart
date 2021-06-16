import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/common/WidgetHelper.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/DimenSize.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';
import 'package:wallpaper/view/home/BannerImgItem.dart';
import 'package:wallpaper/view/home/CategoryTagItem.dart';
import 'package:wallpaper/view/home/CategoryWithImgItem.dart';
import 'package:wallpaper/view/home/CircleCategoryItem.dart';
import 'package:wallpaper/view/home/GridItem.dart';
import 'package:wallpaper/view/home/HorizontalListItem.dart';
import 'package:wallpaper/view/home/LargeSmallItem.dart';
import 'package:wallpaper/view/list/PhotoListItem.dart';
import 'package:wallpaper/view/profile/ProfilePage.dart';
import 'package:wallpaper/view/profile/TextStyles.dart';
import 'package:wallpaper/view/search/SearchPage.dart';

class HomePage extends GetView<HomeController> {
  final _selectedIndex = 0.obs;
  static List<Widget> _widgetOptions = <Widget>[
    // GridItem(ApiConstant.Rect_220_155),
    PhotoListItem(title: 'Nature'),
    PhotoListItem(title: 'Animal'),
    PhotoListItem(title: 'Life'),
    ProfilePage(),
  ];
  HomeController _homeController = Get.find();

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
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        toobar(),
        SliverList(
            delegate: SliverChildListDelegate(
          [
            // BannerImgItem(title: StrConst.TITLE_TECHNOLOGY),
            // SizedBox(height: 10),
            // CircleCategoryItem(title: StrConst.TITLE_COLOR),
            // SizedBox(height: 10),
            // CategoryTagItem(),
            // SizedBox(height: 10),
            // LargeSmallItem(title: StrConst.TITLE_POPULAR),
            // SizedBox(height: 10),
            // CategoryWithImgItem(),
            // SizedBox(height: 10),
            // HorizontalListItem(title: StrConst.TITLE_GIRLS),
            // SizedBox(height: 10),
            // GridItem(title: StrConst.TITLE_NATURE),
            // SizedBox(height: 10),
            HorizontalListItem(title: StrConst.TITLE_GIRLS_DRESS),
            // SizedBox(height: 10),
            // HorizontalListItem(title: StrConst.TITLE_CAR),
            // SizedBox(height: 10),
            // CircleCategoryItem(title: StrConst.TITLE_LIFESTYLE),
            // SizedBox(height: 10),
            // HorizontalListItem(title: StrConst.TITLE_ROBOTIC),
            // SizedBox(height: 80),
          ],
        ))
      ],
    );
  }

  Widget toobar() {
    return SliverAppBar(
      leading: Container(
        child: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.black,
          ),
          onPressed: () {
            Get.toNamed(RoutersConst.profile);
          },
        ),
      ),
      title: getTxtBlackColor(
          msg: StrConst.APP_NAME,
          fontSize: DimenSize.page_title,
          fontWeight: FontWeight.bold),

      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
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
            icon: Icon(
              Icons.notifications_none_outlined,
              color: ColorConst.BLACK_COLOR,
            ),
            onPressed: () {
              // _homeController.photoOrder();
            }),
      ],
      elevation: 50,
      backgroundColor: Colors.transparent,
      // expandedHeight: Get.height - 50,
      snap: false,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(color: Colors.transparent),
        ),
      ),
    );
  }

  Widget getBottomBar() {
    return BottomNavigationBar(
      backgroundColor: ColorConst.WHITE_COLOR,
      items: <BottomNavigationBarItem>[
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
      },
    );
  }

  Widget showBottomItem() {
    return _selectedIndex.value == 2 || _selectedIndex.value == 4
        ? Container(
            child: _widgetOptions.elementAt(_selectedIndex.value),
          )
        : Container(
            color: ColorConst.WHITE_COLOR,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0, right: 10),
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
                          children: <Widget>[
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
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.payment,
                        color: ColorConst.BLACK_COLOR,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                // SearchBar('Search for restaurants, Cusines...'),
                _widgetOptions.elementAt(_selectedIndex.value),
              ],
            ),
          );
  }
}
