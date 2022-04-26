import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/utils/apiutils/api_response.dart';
import 'package:widepixelimage/utils/common/ValidationHelper.dart';
import 'package:widepixelimage/utils/constant/AssetsConst.dart';
import 'package:widepixelimage/utils/constant/ColorConst.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';
import 'package:widepixelimage/utils/sp/sp_manager.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//  {START TEXT VIEW}
Text getTxt(
    {required String msg,
    FontWeight fontWeight = FontWeight.normal,
    int? maxLines,
    TextAlign textAlign = TextAlign.start}) {
  return Text(msg,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(fontWeight: fontWeight));
}

Text getTxtAppColor(
    {required String msg,
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

Text getTxtWhiteColor(
    {required String msg,
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

Text getTxtBlackColor(
    {required String msg,
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

Text getTxtGreyColor(
    {required String msg,
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

Text getTxtColor(
    {required String msg,
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

TextStyle _getFontStyle(
    {required Color txtColor,
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

Widget edtPwdField(
    {required TextEditingController control,
    bool pwdVisible = false,
    bool isRect = true,
    IconData icons = Icons.lock_outline,
    Function? pwdVisibleClick}) {
  return TextFormField(
    controller: control,
    decoration: InputDecoration(
      counterText: '',
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
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
      hintStyle: const TextStyle(
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

Widget edtDobField(
    {required TextEditingController control,
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      border: OutlineInputBorder(
          borderRadius:
              isRect ? BorderRadius.circular(0) : BorderRadius.circular(30)),
      hintText: title,
      prefixIcon: Icon(
        icons,
        color: iconColor,
      ),
      hintStyle:
          const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
    ),
    textInputAction: TextInputAction.next,
    maxLength: 32,
    readOnly: true,
    controller: control,
    // validator: (dob) => ValidationHelper.empty(dob, 'DOB is Required'),
  );
}

Widget edtRectField(
    {TextEditingController? control,
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
        hintStyle:
            const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
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
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 8, top: 5),
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
            const SizedBox(height: 5),
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Select Time",
      hintStyle:
          const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
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
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      border: OutlineInputBorder(
          gapPadding: 30, borderRadius: BorderRadius.circular(30)),
      hintText: "Enter Rate",
      hintStyle:
          const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
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
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        border: OutlineInputBorder(
            gapPadding: 30, borderRadius: BorderRadius.circular(30)),
        hintText: "Enter Comments",
        hintStyle:
            const TextStyle(fontWeight: FontWeight.w300, color: Colors.grey)),
    textInputAction: TextInputAction.next,
    maxLength: 150,
  );
}

Widget raisedRoundAppColorBtn(String txt, Function btnClick) => ButtonTheme(
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
    );

Widget raisedRoundColorBtn(String txt, Color color, Function() btnClick) =>
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
    );

AppBar getAppBar({required String title, double fontSize = 15}) {
  return AppBar(
      centerTitle: true,
      title: getTxtBlackColor(
          msg: title, fontWeight: FontWeight.bold, fontSize: fontSize));
}

AppBar getAppBarWithBackBtn(
    {String title = '',
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
  return const Divider(
    color: ColorConst.GREY_COLOR,
    height: 1,
  );
}

onWillPop() async {
  Widget widget = AlertDialog(
    content: getTxtColor(
        msg: StringConst.are_you_sure_exit,
        fontSize: 17,
        txtColor: ColorConst.BLACK_COLOR),
    title: getTxtBlackColor(
        msg: StringConst.warning, fontSize: 18, fontWeight: FontWeight.bold),
    actions: <Widget>[
      ElevatedButton(
          child: getTxtBlackColor(msg: StringConst.yes, fontSize: 17),
          onPressed: () async {
            await SPManager.clearPref();
            Get.offAllNamed(RoutersConst.home);
          }),
      ElevatedButton(
          child: getTxtBlackColor(msg: StringConst.no),
          onPressed: () => Get.back()),
    ],
  );
  Get.dialog(widget);
}

showCustomDialog() => showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext ctx) {
      return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: SizedBox(
            height: 150,
            width: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(
                  height: 20,
                ),
                getTxtBlackColor(
                    msg: "Loading...",
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ],
            ),
          ));
    });

Widget showError(String? error) {
  return Visibility(
      visible: (error != null && error.isNotEmpty) ? false : true,
      child: getTxtColor(msg: error ?? '', txtColor: ColorConst.RED_COLOR));
}

showSnackbar(
    {String title = '', String subTitle = '', bool isSuccess = false}) {
  Get.snackbar(title, subTitle,
      backgroundColor:
          isSuccess ? ColorConst.GREEN_COLOR : ColorConst.RED_COLOR,
      colorText: ColorConst.WHITE_COLOR,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3));
}

imagePickerDialog({Function? pickImg}) {
  Widget dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title:
          getTxtBlackColor(msg: 'Select Option', fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              Get.back();
            },
            child: Container(
                padding: const EdgeInsets.all(15),
                child: getTxtBlackColor(msg: 'Take Photo')),
          ),
          const Divider(
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
                  padding: const EdgeInsets.all(15),
                  child: getTxtBlackColor(msg: 'Choose From Gallery'))),
        ],
      ));
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

Widget getCacheImage({
  String url = '',
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
  Container imgWidget;
  var border = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(height / 2)),
    border: Border.all(
      color: ColorConst.APP_COLOR,
      width: borderRadius,
    ),
  );
  if (colorPath != null) {
    //Only color show in File
    imgWidget = Container(
      width: width,
      height: height,
      color: colorPath,
    );
  } else if (assetPath.isNotEmpty) {
    //Asset File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : const BoxDecoration(),
      child: Image.asset(assetPath, fit: fit),
    );
  } else if (filePath != null && filePath.path.isNotEmpty) {
    //Local Device File
    imgWidget = Container(
      width: width,
      height: height,
      decoration: isShowBorderRadius ? border : const BoxDecoration(),
      child: ClipOval(child: Image.file(filePath, fit: fit)),
    );
  } else {
    //Image Remote Url
    Widget cacheImg = CachedNetworkImage(
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
      decoration: isShowBorderRadius ? border : const BoxDecoration(),
      child: isShowBorderRadius ? ClipOval(child: cacheImg) : cacheImg,
    );
  }
  if (isCircle) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(height),
      child: imgWidget,
    );
  } else {
    return imgWidget;
  }
}

Widget getPlaceHolder(int placeHolderPos, double height, double width) {
  switch (placeHolderPos) {
    case 0:
      // LOGO
      return SizedBox(
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
      return SizedBox(
        width: width,
        height: height,
        child: Image.asset(AssetsConst.LOGO_IMG),
      );
  }
}

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add({int hour = 0, int minute = 0, withoutMint = false}) {
    try {
      return replacing(
          hour: this.hour + hour,
          minute: withoutMint ? minute : this.minute + minute);
    } catch (err) {
      return replacing(hour: this.hour, minute: this.minute);
    }
  }

  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

String getTotalAmount(String totalAmount) {
  return totalAmount.replaceAll("₹", '').trim();
}

Widget showLoader({bool isShowDialog = false}) {
  var content = const Center(
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

Widget noDataFound() {
  return Center(
    child: SizedBox(
      width: 250,
      height: 250,
      child: SvgPicture.asset(
        AssetsConst.NO_DATA_FOUND,
        width: Get.width,
      ),
    ),
  );
}

Widget getList({
  required double height,
  required int itemCount,
  Axis scrollDirection = Axis.vertical,
  ScrollPhysics? physics,
  required Function widget,
}) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      // physics: BouncingScrollPhysics(),
      physics: physics ?? const BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) => widget(context, index),
    ),
  );
}

Widget getGrid({
  // required double height,
  required int itemCount,
  int crossAxisCount = 2,
  double childAspectRatio = (1.5 / 1.8),
  ScrollPhysics? physics,
  required Function widget,
}) {
  return GridView.builder(
    itemCount: itemCount,
    shrinkWrap: true,
    physics: physics ?? const BouncingScrollPhysics(),
    // physics: NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(0),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      childAspectRatio: childAspectRatio,
    ),
    itemBuilder: (context, index) => widget(context, index),
  );
}

Widget getStaggered(
    {required double height,
    required int itemCount,
    int crossAxisCount = 2,
    double childAspectRatio = (1.5 / 1.8),
    required Function widget,
    ScrollPhysics? physics,
    ScrollController? controller}) {
  return GridView.custom(
    scrollDirection: Axis.vertical,
    shrinkWrap: true,
    semanticChildCount: 5,
    gridDelegate: SliverStairedGridDelegate(
      crossAxisSpacing: 48,
      mainAxisSpacing: 24,
      startCrossAxisDirectionReversed: true,
      pattern: const [
        StairedGridTile(0.5, 1),
        StairedGridTile(0.5, 3 / 4),
        StairedGridTile(1.0, 10 / 4),
      ],
    ),
    childrenDelegate: SliverChildBuilderDelegate(
      (context, index) => widget(context, index),
    ),
  );
  return GridView.builder(
    itemCount: itemCount,
    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (context, index) {
      return widget(context, index);
    },
  );
  // return StaggeredGridView.countBuilder(
  //     crossAxisCount: crossAxisCount,
  //     mainAxisSpacing: 1.0,
  //     crossAxisSpacing: 1.0,
  //     shrinkWrap: true,
  // controller: controller,
  //     padding: const EdgeInsets.all(0),
  //     staggeredTileBuilder: (int index) => StaggeredTile.extent(1, height),
  //     physics: physics ?? const BouncingScrollPhysics(),
  //     itemCount: itemCount,
  //     itemBuilder: (BuildContext context, int index) => widget(context, index));
}

Widget getHeading(
    {String title = '', bool viewAllShow = true, Function? onClick}) {
  return Container(
    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 15, top: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getTxtBlackColor(msg: title, fontSize: 19, fontWeight: FontWeight.w700),
        if (viewAllShow)
          InkWell(
            onTap: () => onClick!(title),
            child: Container(
              child: getTxtAppColor(
                  msg: 'View All', fontSize: 15, fontWeight: FontWeight.w800),
            ),
          )
      ],
    ),
  );
}

Widget apiHandler<T>(
    {required ApiResponse<T> response, Widget? loading, Widget? error}) {
  if (response.status == null) {
    return Container();
  } else {
    switch (response.status) {
      case ApiStatus.LOADING:
        return loading ??
            Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
              ),
            );
      case ApiStatus.ERROR:
        return Center(
          child: getTxtColor(
              msg: response.apiError!.errorMessage.toString(),
              txtColor: ColorConst.RED_COLOR),
        );
      // return error != null ? error : showError(response.apierror.errorMessage);
      default:
        {
          return Container(
            color: Colors.amber,
            child: getTxtAppColor(msg: StringConst.SOMETHING_WENT_WRONG),
          );
        }
    }
  }
}

Widget _noDataFound() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image.asset(
        AssetsConst.NO_DATA_FOUND,
        height: 150,
        width: 250,
      ),
      const SizedBox(height: 10),
    ],
  );
}
