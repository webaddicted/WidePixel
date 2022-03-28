import 'package:flutter/material.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';

/// Author : Deepak Sharma(Webaddicted)
/// Email : deepaksharmatheboss@gmail.com
/// Profile : https://github.com/webaddicted

class TextStyles {
  TextStyles._();
  static const Color primaryTextColorGrey = Color(0xFF9D9D9D);
  static const Color errorStateLightRed = Color(0xFFFF4C4C);
  static const pageHeading = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConst.BLACK_COLOR,
      fontSize: 24.0
  );
  static const pageSubHeading = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConst.BLACK_COLOR,
      letterSpacing: 2,
      fontSize: 21.0
  );
  static const pageSubHeading1 = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConst.BLACK_COLOR,
      fontSize: 21.0
  );

  static const h1Heading = TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConst.BLACK_COLOR,
      fontSize: 18.0
  );
  static const h1SubHeading = TextStyle(
      fontWeight: FontWeight.normal,
      color: ColorConst.BLACK_COLOR,
      fontSize: 18.0
  );
  static const actionTitle = TextStyle(
      fontWeight: FontWeight.w600,
      color: ColorConst.BLACK_COLOR,
      fontSize: 18.0
  );
  static const actionTitleWhite = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConst.WHITE_COLOR,
      fontSize: 18.0
  );
  static const actionTitleBlack = TextStyle(
      fontWeight: FontWeight.w500,
      color: primaryTextColorGrey,
      fontSize: 18.0
  );
  static const actionTitleBlack1 = TextStyle(
      fontWeight: FontWeight.w600,
      color: ColorConst.BLACK_COLOR,
      fontSize: 16.0
  );
  static const paragraphBold = TextStyle(
      fontWeight: FontWeight.bold,
      color: ColorConst.BLACK_COLOR,
      fontSize: 14.0
  );
  static const paragraphdemibold = TextStyle(
      fontWeight: FontWeight.w600,
      color: primaryTextColorGrey,
      fontSize: 13.0
  );
  static const paragraphdemibold1 = TextStyle(
      fontWeight: FontWeight.w500,
      color: ColorConst.WHITE_COLOR,
      fontSize: 15.0
  );
  static const paragraphdemibold2 = TextStyle(
      fontWeight: FontWeight.w500,
      color: primaryTextColorGrey,
      fontSize: 15.0
  );
  static const subText = TextStyle(
      fontWeight: FontWeight.normal,
      color: primaryTextColorGrey,
      fontSize: 13.0
  );
  static const subTextRed = TextStyle(
      fontWeight: FontWeight.normal,
      color: errorStateLightRed,
      fontSize: 13.0
  );
  static const highlighterOne = TextStyle(
      fontWeight: FontWeight.normal,
      color: primaryTextColorGrey,
      fontSize: 14.0
  );
  static const highlighterTwo = TextStyle(
      fontWeight: FontWeight.normal,
      color: ColorConst.BLACK_COLOR,
      fontSize: 15.0
  );
}