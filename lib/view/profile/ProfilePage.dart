import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/view/profile/TextStyles.dart';

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
  bool selectedValue1=true;
  bool selectedValue2=false;

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
                        title: Text('Shreyas',style: TextStyles.pageHeading,),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('abc@gmail.com'),
                            Row(
                              children: <Widget>[
                                Text('View dineline',style: TextStyle(
                                  color: highlighterPink,

                                ),),
                                Icon(Icons.arrow_right,color: highlighterPink,)
                              ],
                            ),
                          ],
                        ),
                        isThreeLine: true,

                        trailing: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/60895972?s=460&v=4'),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.bookmark),
                              SizedBox(height: 5,),
                              Text('Bookmarks')
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.notifications),
                              SizedBox(height: 5,),
                              Text('Notifications')
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.settings),
                              SizedBox(height: 5,),
                              Text('Settings')
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Icon(Icons.payment),
                              SizedBox(height: 5,),
                              Text('Payments')
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Zomato Gold'),
                        trailing: Icon(Icons.arrow_right),
                      ),
                      Divider(),
                      Text('Food Orders',style: TextStyles.actionTitleBlack,),
                      ListTile(
                        leading: Icon(Icons.shopping_bag,color: ColorConst.BLACK_COLOR,),
                        title: Text('Your Orders',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        leading: Icon(Icons.favorite,color: ColorConst.BLACK_COLOR,),
                        title: Text('Favorite Orders',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        leading: Icon(Icons.add_business_rounded,color: ColorConst.BLACK_COLOR,),
                        title: Text('Address Book',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        leading: Icon(Icons.help_outline_sharp,color: ColorConst.BLACK_COLOR,),
                        title: Text('Online Ordering Help',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      Text('food@word',style: TextStyles.actionTitleBlack,),
                      ListTile(
                        leading: Icon(Icons.toggle_off,color: ColorConst.BLACK_COLOR,),
                        title: Text('Enable',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      Text('Table Bookings',style: TextStyles.actionTitleBlack,),
                      ListTile(
                        leading: Icon(Icons.calendar_today_rounded,color: ColorConst.BLACK_COLOR,),
                        title: Text('Your Bookings',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        leading: Icon(Icons.repeat_one_sharp,color: ColorConst.BLACK_COLOR,),
                        title: Text('Table Reservation Help',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('About',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        title: Text('Send Feedback',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Report a Safety Emergency',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Rate us on the Play Store',style: TextStyles.highlighterTwo,),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      ListTile(
                        title: Text('Log Out',style: TextStyles.highlighterTwo,),
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
          Container(
            child: Image.network(
                'https://b.zmtcdn.com/data/red_images/ed0fac4012f951e305f227369d7abb7a.jpg'),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Select your membership',
            style: TextStyles.pageSubHeading,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Inida (41 cities)',
            style: TextStyle(color: blackColor, letterSpacing: 2),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedValue1=true;
                        selectedValue2=false;
                      });
                    },
                    child: Container(
                      width: 170,
                      height: 160,
                      child: Card(
                        elevation: 0,
                        shape: BeveledRectangleBorder(
                          side: BorderSide(
                            color:selectedValue1==true?gold:separatorGrey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(3.0),

                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(2),
                                width: double.infinity,
                                color: selectedValue1==true?gold:ColorConst.WHITE_COLOR,
                                child: Center(
                                  child: Text(
                                    'Great Value',
                                    style: TextStyle(color: selectedValue1==true?ColorConst.WHITE_COLOR:primaryTextColorGrey,),
                                  ),
                                )),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '12',
                                  style: TextStyles.pageHeading,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'months',
                                  style: TextStyles.actionTitleBlack,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'Rs. 1,800',
                                  style: TextStyles.h1SubHeading,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedValue1=false;
                        selectedValue2=true;
                      });
                    },
                    child: Container(
                      width: 170,
                      height: 160,
                      child: Card(

                        shape: BeveledRectangleBorder(
                          side: BorderSide(
                            color: selectedValue2==true?gold:ColorConst.WHITE_COLOR,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(3.0),

                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(3),
                                width: double.infinity,
                                color: selectedValue2==true?gold:ColorConst.WHITE_COLOR,
                                child: Center(
                                  child: Text(
                                    'Most Popular',
                                    style: TextStyle(color: selectedValue2==true?ColorConst.WHITE_COLOR:primaryTextColorGrey,),
                                  ),
                                )),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  '6',
                                  style: TextStyles.pageHeading,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'months',
                                  style: TextStyles.actionTitleBlack,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  'Rs. 999',
                                  style: TextStyles.h1SubHeading,
                                ),
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
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 70.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            width: double.infinity,
            child: RaisedButton(

              color: highlighterPink,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Buy Now', style:TextStyles.actionTitleWhite),
                  selectedValue1==true?Text('12 months membership @ Rs. 1200', style: TextStyles.paragraphdemibold1):Text('6 months membership @ Rs. 999', style: TextStyles.paragraphdemibold1),
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Dining restaurants and bars to',style: TextStyles.pageSubHeading1,),
                  Text('choose from',style: TextStyles.pageSubHeading1,),
                  SizedBox(height: 5.0,),
                  Text('across Bengaluru and 40 more cities',style: TextStyles.paragraphdemibold2,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Delivery restaurants to order',style: TextStyles.pageSubHeading1,),
                  Text(' from',style: TextStyles.pageSubHeading1,),
                  SizedBox(height: 5.0,),
                  Text('across Bengaluru and 40 more cities',style: TextStyles.paragraphdemibold2,)
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(left:15.0),
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
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: <Widget>[
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(6.0),
                                      child: Image.network('https://cdn.pixabay.com/photo/2016/12/26/16/09/bowl-1932375__480.jpg',width: 150.0,height: 100.0,)),
                                  SizedBox(height: 10.0,),
                                  Text('Polar bear',style: TextStyles.actionTitleBlack1,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.star,color: blackColor,size: 15,),
                                      Text('4.2'),
                                      SizedBox(width: 20,),
                                      Icon(Icons.star,color: highlighterPink,size: 15,),
                                      Text('3.5'),
                                    ],

                                  ),
                                  Text('Brookefield',style: TextStyles.subText,)
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Frequently Asked Questions',style: TextStyles.pageSubHeading1,),

                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(

                        child: Card(
                          elevation: 0,
                          shape: BeveledRectangleBorder(
                            side: BorderSide(
                              color:separatorGrey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3.0),

                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all( 10.0),
                                  child: Text(
                                    '1+1 and 2+2',
                                    style: TextStyles.highlighterTwo,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text(
                                    '13 answers',
                                    style: TextStyles.subText,
                                  ),
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
                            side: BorderSide(
                              color:separatorGrey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3.0),

                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all( 10.0),
                                  child: Text(
                                    'Benefits on Delivery',
                                    style: TextStyles.highlighterTwo,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text(
                                    '5 answers',
                                    style: TextStyles.subText,
                                  ),
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
                            side: BorderSide(
                              color:separatorGrey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(3.0),

                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.all( 10.0),
                                  child: Text(
                                    'Flat Discounts',
                                    style: TextStyles.highlighterTwo,
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:8.0),
                                  child: Text(
                                    '12 answers',
                                    style: TextStyles.subText,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Card(),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      side: BorderSide(
                        color:separatorGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3.0),

                    ),
                    child: ListTile(
                      leading: Icon(Icons.help_outline_outlined,color:Colors.green),
                      title: Text('Still need help? Chat with us.',style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                  Card(
                    elevation: 0,
                    shape: BeveledRectangleBorder(
                      side: BorderSide(
                        color:separatorGrey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(3.0),

                    ),
                    child: ListTile(
                      leading: Icon(Icons.error,color:highlighterPink),
                      title: Text('Terms and Conditions',style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),),
                      trailing: Icon(Icons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Have a membership activation',style: TextStyles.pageSubHeading1,),
                  Text(' code?',style: TextStyles.pageSubHeading1,),

                ],
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: TextFormField(


                decoration: InputDecoration(

                    labelText: 'Enter your code'
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0,),
        ],
      ),
    );
  }
}