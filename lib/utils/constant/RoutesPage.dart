import 'package:get/route_manager.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/view/detail/DetailPage.dart';
import 'package:widepixelimage/view/fullImage/FullImagePage.dart';
import 'package:widepixelimage/view/home/HomePage.dart';
import 'package:widepixelimage/view/list/ListPage.dart';
import 'package:widepixelimage/view/preview/PreviewPage.dart';
import 'package:widepixelimage/view/profile/ProfilePage.dart';
import 'package:widepixelimage/view/welcome/GetStartPage.dart';
import 'package:widepixelimage/view/welcome/InterestPage.dart';
import 'package:widepixelimage/view/welcome/SplashPage.dart';
import 'package:widepixelimage/view/welcome/OnboardingPage.dart';

RoutesPage() => [
  GetPage(name: RoutersConst.initialRoute, page: () => SplashPage()),
  GetPage(name: RoutersConst.onboard_page, page: () => OnboardingPage()),
  GetPage(name: RoutersConst.welcome_page, page: () => SplashPage()),
  GetPage(name: RoutersConst.interest_page, page: () => InterestedPage()),
  GetPage(name: RoutersConst.get_start, page: () => GetStartPage()),

  GetPage(name: RoutersConst.home, page: () => HomePage()),
  GetPage(name: RoutersConst.list, page: () => ListPage()),
  GetPage(name: RoutersConst.detail, page: () => DetailPage()),
  GetPage(name: RoutersConst.profile, page: () => ProfilePage()),
  GetPage(name: RoutersConst.fullimage, page: () => FullImagePage()),
  GetPage(name: RoutersConst.preview, page: () => PreviewPage()),


  // GetPage(name: RoutersConst.login, page: () => LoginPage()),
  // GetPage(name: "products/:id", page: () => Product()),
  // GetPage(name: "/cart", page: () => Cart()),
];