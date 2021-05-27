import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wallpaper/utils/common/ValidationHelper.dart';
import 'package:wallpaper/utils/constant/AssetsConst.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';
import 'package:wallpaper/utils/constant/RoutersConst.dart';
import 'package:wallpaper/utils/constant/StrConst.dart';
import 'package:wallpaper/utils/sp/sp_manager.dart';

//  {START TEXT VIEW}
Text getTxt({required String msg,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(msg,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontWeight: fontWeight));
}

Text getTxtAppColor({required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.APP_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtWhiteColor({required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    maxLines: maxLines,
    textAlign: textAlign,
    style: _getFontStyle(
        txtColor: ColorConst.WHITE_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtBlackColor({required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.BLACK_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtGreyColor({required String msg,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: ColorConst.GREY_COLOR,
        fontSize: fontSize,
        fontWeight: fontWeight),
  );
}

Text getTxtColor({required String msg,
  required Color txtColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  int? maxLines,
  TextAlign textAlign = TextAlign.start}) {
  return Text(
    msg,
    textAlign: textAlign,
    maxLines: maxLines,
    style: _getFontStyle(
        txtColor: txtColor, fontSize: fontSize, fontWeight: fontWeight),
  );
}

TextStyle _getFontStyle({required Color txtColor,
  double fontSize = 15,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = AssetsConst.ZILLASLAB_FONT,
  TextDecoration txtDecoration = TextDecoration.none}) {
  return TextStyle(
      color: txtColor,
      fontSize: fontSize,
      decoration: txtDecoration,
      fontFamily: fontFamily,
      fontWeight: fontWeight);
}

//  {END TEXT VIEW}

Widget edtPwdField({required TextEditingController control,
  bool pwdVisible = false,
  bool isRect = true,
  IconData icons = Icons.lock_outline,
  Function? pwdVisibleClick}) {
  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      border: OutlineInputBorder(
          borderRadius:
          isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
      hintText: "Password",
      prefixIcon: Icon(icons),
      suffixIcon: IconButton(
          icon: Icon(
            // Based on passwordVisible state choose the icon
            pwdVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () => pwdVisibleClick),
      hintStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey,
      ),
    ),
    obscureText: !pwdVisible,
    textInputAction: TextInputAction.done,
    maxLength: 32,
    // validator: ValidationHelper.validateNormalPass,
  );
}

Widget edtDobField({required TextEditingController control,
  bool isRect = true,
  validate,
  IconData? icons,
  Color iconColor = Colors.grey,
  String title = '',
  Function? click}) {
  return TextFormField(
    onTap: () => click,
    validator: validate,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      border: OutlineInputBorder(
          borderRadius:
          isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
      hintText: title,
      prefixIcon: Icon(
        icons,
        color: iconColor,
      ),
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: control,
    // validator: (dob) => ValidationHelper.empty(dob, 'DOB is Required'),
  );
}

Widget edtRectField({TextEditingController? control,
  String hint = '',
  validate,
  IconData? icons,
  bool isRect = true,
  int txtLength = 32,
  keyboardType,
  bool isReadOnly = false,
  int maxLine = 1,
  double contentVerticalPadding = 5,
  double contentHoriPadding = 5,
  textCapitalization = TextCapitalization.words}) {
  return TextFormField(
      textCapitalization: textCapitalization,
      //TextCapitalization.words,
      controller: control,
      textInputAction: TextInputAction.next,
      maxLength: txtLength,
      validator: validate,
      keyboardType: keyboardType,
      maxLines: maxLine,
      //TextInputType.number,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(
            horizontal: contentHoriPadding, vertical: contentVerticalPadding),
        border: OutlineInputBorder(
            borderRadius:
            isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
        hintText: hint,
        prefixIcon: Icon(icons),
        labelText: hint,
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
      ));
}

Widget edtDateField(Function dateClick,
    {String date = '',
      String title = '',
      Color titleColor = ColorConst.BLACK_COLOR,
      Color? bgColor}) {
  return Expanded(
    child: InkWell(
      onTap: () => dateClick,
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 8, top: 5),
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getTxtColor(
              msg: title,
              txtColor: titleColor,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 5),
            getTxtBlackColor(msg: date)
          ],
        ),
      ),
    ),
  );
}

Widget edtTimeField(TextEditingController edtController, Function timeClick) {
  return TextFormField(
    onTap: () => timeClick,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Select Time",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: edtController,
    validator: (dob) => ValidationHelper.empty(dob!, 'Time is Required'),
  );
}

Widget edtRateField(TextEditingController edtController) {
  return TextFormField(
    controller: edtController,
    decoration: InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Enter Rate",
      hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 10,
    keyboardType: TextInputType.number,
    validator: (rate) => ValidationHelper.empty(rate!, 'Rate is Required'),
  );
}

Widget edtCommentField(TextEditingController edtController) {
  return TextFormField(
    textCapitalization: TextCapitalization.words,
    controller: edtController,
    decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
            gapPadding: 30, borderRadius: BorderRadius.circular(30)),
        hintText: "Enter Comments",
        hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey)),
    textInputAction: TextInputAction.next,
    maxLength: 150,
  );
}

Widget raisedRoundAppColorBtn(String txt, Function btnClick) =>
    ButtonTheme(
//  minWidth: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () => btnClick,
        clipBehavior: Clip.antiAlias,
        child: getTxtWhiteColor(
            msg: 'Add Address', fontSize: 15, fontWeight: FontWeight.bold),
        style: ElevatedButton.styleFrom(
            primary: ColorConst.APP_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
      // child: RaisedButton(
      //   padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
      //   shape: StadiumBorder(),
      //   color: ColorConst.APP_COLOR,
      //   child: getTxtWhiteColor(
      //       msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      //   onPressed: btnClick,
      // ),
    );

Widget raisedRoundColorBtn(String txt, Color color, Function btnClick()) =>
    ButtonTheme(
//  minWidth: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          btnClick();
        },
        clipBehavior: Clip.antiAlias,
        child: getTxtWhiteColor(
            msg: 'Add Address', fontSize: 15, fontWeight: FontWeight.bold),
        style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
      ),
      // child: RaisedButton(
      //   padding: EdgeInsets.only(top: 15, bottom: 15, left: 70, right: 70),
      //   shape: StadiumBorder(),
      //   color: ColorConst.APP_COLOR,
      //   child: getTxtWhiteColor(
      //       msg: txt, fontSize: 15, fontWeight: FontWeight.bold),
      //   onPressed: btnClick,
      // ),
    );

AppBar getAppBar({required String title, double fontSize = 15}) {
  return AppBar(
      centerTitle: true,
      title: getTxtBlackColor(
          msg: title, fontWeight: FontWeight.bold, fontSize: fontSize));
}

AppBar getAppBarWithBackBtn({String title = '',
  Color bgColor = ColorConst.WHITE_COLOR,
  double fontSize = 15,
  String titleTag = '',
  Widget? icon,
  List<Widget>? actions}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: icon,
    actions: actions,
    centerTitle: true,
    title: Hero(
        tag: titleTag,
        child: getTxtColor(
            msg: title,
            txtColor: ColorConst.BLACK_COLOR,
            fontSize: fontSize,
            fontWeight: FontWeight.bold)),
  );
}

Divider getDivider() {
  return Divider(
    color: ColorConst.GREY_COLOR,
    height: 1,
  );
}

onWillPop() async {
  Widget widget = AlertDialog(
    content: getTxtColor(
        msg: StrConst.are_you_sure_exit,
        fontSize: 17,
        txtColor: ColorConst.BLACK_COLOR),
    title: getTxtBlackColor(
        msg: StrConst.warning, fontSize: 18, fontWeight: FontWeight.bold),
    actions: <Widget>[
      FlatButton(
          child: getTxtBlackColor(msg: StrConst.yes, fontSize: 17),
          onPressed: () async {
            await SPManager.clearPref();
            Get.offAllNamed(RoutersConst.home);
          }),
      FlatButton(
          child: getTxtBlackColor(msg: StrConst.no),
          onPressed: () => Get.back()),
    ],
  );
  Get.dialog(widget);
}

showCustomDialog() =>
    showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                height: 150,
                width: 130,
                child: Container(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      getTxtBlackColor(
                          msg: "Loading...",
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                ),
              ));
        });

Widget showError(String? error) {
  return Visibility(
      visible: (error != null && error.length > 0) ? false : true,
      child: getTxtColor(msg: error ?? '', txtColor: ColorConst.RED_COLOR));
}

showSnackbar(
    {String title = '', String subTitle = '', bool isSuccess = false}) {
  Get.snackbar(title, subTitle,
      backgroundColor:
      isSuccess ? ColorConst.GREEN_COLOR : ColorConst.RED_COLOR,
      colorText: ColorConst.WHITE_COLOR,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3));
}

imagePickerDialog({Function? pickImg}) {
  Widget dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title:
      getTxtBlackColor(msg: 'Select Option', fontWeight: FontWeight.bold),
      content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () async {
                  Get.back();
                  // var image = await ImagePicker.pickImage(source: ImageSource.camera);
                  // getImage(ImageSource.camera, pickImg);
                  // getImageFromCamera(context, 0, selectedfile);
                },
                child: Container(
                    padding: EdgeInsets.all(15),
                    child: getTxtBlackColor(msg: 'Take Photo')),
              ),
              Divider(
                color: Colors.grey,
                height: 1,
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                    // getImage(ImageSource.gallery, pickImg);
                    // var image = await ImagePicker.pickImage(source: ImageSource.gallery);
                    // getImageFromCamera(context, 1, selectedfile);
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: getTxtBlackColor(msg: 'Choose From Gallery'))),
            ],
          )));
  Get.dialog(dialog);
}

// void getImage(imageType, Function pickImg) async {
//   var image = await ImagePicker.platform.pickImage(source: imageType);
//   File filePath = File(image.path);
//   final bytes = filePath.readAsBytesSync();
//   var base64Image = 'data:image/jpeg;base64,' + base64Encode(bytes);
//   // print('object base64Image $base64Image');
//   pickImg(filePath, base64Image);
//   // base64Image = Io.File(filePath.path).readAsBytesSync();
// }

// Widget apiHandler<T>(
//     {@required ApiResponse<T> response, Widget loading, Widget error}) {
//   if (response.status == null)
//     return Container();
//   else {
//     switch (response.status) {
//       case ApiStatus.LOADING:
//         return loading != null
//             ? loading
//             : Center(
//                 child: CircularProgressIndicator(
//                   valueColor:
//                       AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
//                 ),
//               );
//         break;
//       case ApiStatus.ERROR:
//         return Center(
//           child: getTxtColor(
//               msg: response.apierror.errorMessage,
//               txtColor: ColorConst.RED_COLOR),
//         );
//         // return error != null ? error : showError(response.apierror.errorMessage);
//         break;
//       default:
//         {
//           return Container(
//             color: Colors.amber,
//             child: getTxtAppColor(msg: StrConst.SOMETHING_WENT_WRONG),
//           );
//         }
//     }
//   }
// }

Widget getCacheImage({String url = '',
  String assetPath = '',
  Color? colorPath,
  File? filePath,
  double height = double.infinity,
  double width = double.infinity,
  int placeHolder = 0,
  bool isCircle = false,
  bool isShowBorderRadius = false,
  double borderRadius = 2,
  BoxFit fit = BoxFit.cover,
}) {
  var imgWidget;
  var border = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(new Radius.circular(height / 2)),
    border: Border.all(
      color: ColorConst.APP_COLOR,
      width: borderRadius,
    ),
  );
  if (colorPath != null) {
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      color: colorPath,
    );
  } else if (assetPath.length > 0) {
    //Asset File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: Image.asset(assetPath, fit: fit),
    );
  } else if (filePath != null && filePath.path.length > 0) {
    //Local Device File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: ClipOval(child: Image.file(filePath, fit: fit)),
    );
  } else {
    //Image Remote Url
    Widget cachImg = CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) => getPlaceHolder(placeHolder, height, width),
      errorWidget: (context, url, error) =>
          getPlaceHolder(placeHolder, height, width),
    );
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : BoxDecoration(),
      child: isShowBorderRadius ? ClipOval(child: cachImg) : cachImg,
    );
  }
  if (isCircle)
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: imgWidget,
    );
  else
    return imgWidget;
}

Widget getPlaceHolder(int placeHolderPos, double height, double width) {
  switch (placeHolderPos) {
    case 0:
    // LOGO
      return Container(
        width: width,
        height: height,
        child: Image.asset(AssetsConst.LOGO_IMG),
      );
    case 1:
    // Grey Shade
      return Container(
        width: width,
        height: height,
        color: Colors.grey[400],
      );
  // case 2:
  //   // Upload
  //   return Container(
  //     width: width,
  //     height: height,
  //     child: Icon(Icons.upload_file),
  //   );
    default:
      return Container(
        width: width,
        height: height,
        child: Image.asset(AssetsConst.LOGO_IMG),
      );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0, withoutMint = false}) {
    try {
      return this.replacing(
          hour: this.hour + hour,
          minute: withoutMint ? minute : this.minute + minute);
    } catch (err) {
      return this.replacing(hour: this.hour, minute: this.minute);
    }
  }

  int compareTo(TimeOfDay other) {
    if (this.hour < other.hour) return -1;
    if (this.hour > other.hour) return 1;
    if (this.minute < other.minute) return -1;
    if (this.minute > other.minute) return 1;
    return 0;
  }
}

String getTotalAmount(String totalAmount) {
  return totalAmount.replaceAll("₹", '').trim();
}

Widget showLoader({bool isShowDialog = false}) {
  var content = Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(ColorConst.WHITE_COLOR),
    ),
  );
  return isShowDialog
      ? AlertDialog(
      scrollable: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: content)
      : content;
}

// Widget noDataFound() {
//   return Center(
//       child: Image.asset(
//     AssetsConst.NO_DATA_FOUND_IMG,
//     height: 150,
//     width: 250,
//   ));
// }

Widget getList({
  required double height,
  required int itemCount,
  Axis scrollDirection = Axis.vertical,
  required Function widget,
}) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) => widget(context, index),
    ),
  );
}
