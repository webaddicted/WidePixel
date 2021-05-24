import 'package:get/route_manager.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/view/welcome/InterestPage.dart';
import 'package:wallpaper/view/SplashPage.dart';
import 'package:wallpaper/view/welcome/OnboardingPage.dart';

RoutesPage() => [
  GetPage(name: RoutersConst.initialRoute, page: () => SplashPage()),
  GetPage(name: RoutersConst.onboard_page, page: () => OnboardingPage()),
  GetPage(name: RoutersConst.welcome_page, page: () => SplashPage()),
  GetPage(name: RoutersConst.interest_page, page: () => InterestedPage()),
  GetPage(name: RoutersConst.home, page: () => SplashPage()),

  // GetPage(name: RoutersConst.login, page: () => LoginPage()),

  // GetPage(name: "products/:id", page: () => Product()),
  // GetPage(name: "/cart", page: () => Cart()),
];