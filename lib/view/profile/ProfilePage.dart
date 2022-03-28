import 'package:flutter/material.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/view/profile/TextStyles.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  static const Color primaryTextColorGrey = Color(0xFF9D9D9D);
  static const Color highlighterPink = Color(0xFFFF6961);
  static const Color gold = Color(0xFFd4af38);
  static const Color separatorGrey = Color(0xFFEAEAEA);
  static const Color blackColor = Color(0xFF000000);
  bool selectedValue1 = true;
  bool selectedValue2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorConst.WHITE_COLOR,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListTile(
                        title: const Text(
                          'Shreyas',
                          style: TextStyles.pageHeading,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('abc@gmail.com'),
                            Row(
                              children: const <Widget>[
                                Text(
                                  'View dineline',
                                  style: TextStyle(
                                    color: highlighterPink,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: highlighterPink,
                                )
                              ],
                            ),
                          ],
                        ),
                        isThreeLine: true,
                        trailing: const CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(
                              'https://avatars1.githubusercontent.com/u/60895972?s=460&v=4'),
                        ),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: const <Widget>[
                              Icon(Icons.bookmark),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Bookmarks')
                            ],
                          ),
                          Column(
                            children: const <Widget>[
                              Icon(Icons.notifications),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Notifications')
                            ],
                          ),
                          Column(
                            children: const <Widget>[
                              Icon(Icons.settings),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Settings')
                            ],
                          ),
                          Column(
                            children: const <Widget>[
                              Icon(Icons.payment),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Payments')
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text('Zomato Gold'),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      const Divider(),
                      const Text(
                        'Food Orders',
                        style: TextStyles.actionTitleBlack,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.shopping_bag,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Your Orders',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Favorite Orders',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.add_business_rounded,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Address Book',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.help_outline_sharp,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Online Ordering Help',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const Divider(),
                      const Text(
                        'food@word',
                        style: TextStyles.actionTitleBlack,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.toggle_off,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Enable',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const Divider(),
                      const Text(
                        'Table Bookings',
                        style: TextStyles.actionTitleBlack,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.calendar_today_rounded,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Your Bookings',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.repeat_one_sharp,
                          color: ColorConst.BLACK_COLOR,
                        ),
                        title: Text(
                          'Table Reservation Help',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text(
                          'About',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const Divider(),
                      const ListTile(
                        title: Text(
                          'Send Feedback',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        title: Text(
                          'Report a Safety Emergency',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        title: Text(
                          'Rate us on the Play Store',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      const ListTile(
                        title: Text(
                          'Log Out',
                          style: TextStyles.highlighterTwo,
                        ),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ),
              getGold()
            ],
          ),
        ),
      ),
    );
  }

  Widget getGold() {
    return Container(
      color: ColorConst.WHITE_COLOR,
      child: Column(
        children: <Widget>[
          Image.network(
              'https://b.zmtcdn.com/data/red_images/ed0fac4012f951e305f227369d7abb7a.jpg'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Select your membership',
            style: TextStyles.pageSubHeading,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Inida (41 cities)',
            style: TextStyle(color: blackColor, letterSpacing: 2),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue1 = true;
                      selectedValue2 = false;
                    });
                  },
                  child: SizedBox(
                    width: 170,
                    height: 160,
                    child: Card(
                      elevation: 0,
                      shape: BeveledRectangleBorder(
                        side: BorderSide(
                          color: selectedValue1 == true ? gold : separatorGrey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.all(2),
                              width: double.infinity,
                              color: selectedValue1 == true
                                  ? gold
                                  : ColorConst.WHITE_COLOR,
                              child: Center(
                                child: Text(
                                  'Great Value',
                                  style: TextStyle(
                                    color: selectedValue1 == true
                                        ? ColorConst.WHITE_COLOR
                                        : primaryTextColorGrey,
                                  ),
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              '12',
                              style: TextStyles.pageHeading,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'months',
                              style: TextStyles.actionTitleBlack,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Rs. 1,800',
                              style: TextStyles.h1SubHeading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue1 = false;
                      selectedValue2 = true;
                    });
                  },
                  child: SizedBox(
                    width: 170,
                    height: 160,
                    child: Card(
                      shape: BeveledRectangleBorder(
                        side: BorderSide(
                          color: selectedValue2 == true
                              ? gold
                              : ColorConst.WHITE_COLOR,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                              padding: const EdgeInsets.all(3),
                              width: double.infinity,
                              color: selectedValue2 == true
                                  ? gold
                                  : ColorConst.WHITE_COLOR,
                              child: Center(
                                child: Text(
                                  'Most Popular',
                                  style: TextStyle(
                                    color: selectedValue2 == true
                                        ? ColorConst.WHITE_COLOR
                                        : primaryTextColorGrey,
                                  ),
                                ),
                              )),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              '6',
                              style: TextStyles.pageHeading,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'months',
                              style: TextStyles.actionTitleBlack,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Rs. 999',
                              style: TextStyles.h1SubHeading,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: 70.0,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            width: double.infinity,
            child: RaisedButton(
              color: highlighterPink,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Buy Now', style: TextStyles.actionTitleWhite),
                  selectedValue1 == true
                      ? const Text('12 months membership @ Rs. 1200',
                          style: TextStyles.paragraphdemibold1)
                      : const Text('6 months membership @ Rs. 999',
                          style: TextStyles.paragraphdemibold1),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Dining restaurants and bars to',
                  style: TextStyles.pageSubHeading1,
                ),
                Text(
                  'choose from',
                  style: TextStyles.pageSubHeading1,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'across Bengaluru and 40 more cities',
                  style: TextStyles.paragraphdemibold2,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Delivery restaurants to order',
                  style: TextStyles.pageSubHeading1,
                ),
                Text(
                  ' from',
                  style: TextStyles.pageSubHeading1,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'across Bengaluru and 40 more cities',
                  style: TextStyles.paragraphdemibold2,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(6.0),
                                  child: Image.network(
                                    'https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',
                                    width: 150.0,
                                    height: 100.0,
                                  )),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Polar bear',
                                style: TextStyles.actionTitleBlack1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: blackColor,
                                    size: 15,
                                  ),
                                  Text('4.2'),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: highlighterPink,
                                    size: 15,
                                  ),
                                  Text('3.5'),
                                ],
                              ),
                              const Text(
                                'Brookefield',
                                style: TextStyles.subText,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Frequently Asked Questions',
                  style: TextStyles.pageSubHeading1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        elevation: 0,
                        shape: BeveledRectangleBorder(
                          side: const BorderSide(
                            color: separatorGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Column(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                '1+1 and 2+2',
                                style: TextStyles.highlighterTwo,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '13 answers',
                                style: TextStyles.subText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Card(
                        elevation: 0,
                        shape: BeveledRectangleBorder(
                          side: const BorderSide(
                            color: separatorGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Column(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Benefits on Delivery',
                                style: TextStyles.highlighterTwo,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '5 answers',
                                style: TextStyles.subText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Card(
                        elevation: 0,
                        shape: BeveledRectangleBorder(
                          side: const BorderSide(
                            color: separatorGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3.0),
                        ),
                        child: Column(
                          children: const <Widget>[
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Flat Discounts',
                                style: TextStyles.highlighterTwo,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                '12 answers',
                                style: TextStyles.subText,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Card(),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 0,
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(
                      color: separatorGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: const ListTile(
                    leading:
                        Icon(Icons.help_outline_outlined, color: Colors.green),
                    title: Text(
                      'Still need help? Chat with us.',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ),
                Card(
                  elevation: 0,
                  shape: BeveledRectangleBorder(
                    side: const BorderSide(
                      color: separatorGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.error, color: highlighterPink),
                    title: Text(
                      'Terms and Conditions',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    trailing: Icon(Icons.arrow_right),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Have a membership activation',
                  style: TextStyles.pageSubHeading1,
                ),
                Text(
                  ' code?',
                  style: TextStyles.pageSubHeading1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TextFormField(
              decoration: const InputDecoration(labelText: 'Enter your code'),
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
        ],
      ),
    );
  }
}
