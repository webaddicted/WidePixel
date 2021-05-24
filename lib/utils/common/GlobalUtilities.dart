import 'dart:io';

// import 'package:bike_customer/data/bean/common/task_item.dart';
// import 'package:bike_customer/utils/sp/sp_manager.dart';
// import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/utils/sp/sp_manager.dart';
// import 'package:intl/intl.dart';

//  {START PAGE NAVIGATION}
void navigationPush(BuildContext context, StatefulWidget route) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return route;
    },
  ));
}

void navigationRemoveAllPush(BuildContext context, StatefulWidget route) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => route,
    ),
    (route) => false,
  );
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

//  {END PAGE NAVIGATION}

// Future<String> deviceId() async {
//   String deviceId = '';
//   if (Platform.isAndroid) {
//     AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
//     deviceId = info.androidId;
//   } else {
//     IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
//     deviceId = iosInfo.utsname.machine;
//   }
//   return deviceId;
// // return 'WER34dfer34erdf';
// }

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

logout() {
  SPManager.clearPref();
  // navigationRemoveAllPush(ctx, LoginPage());
}
delay({double durationSec = 1, required Function click}){
  int sec =  (durationSec*1000).toInt();
  Future.delayed(Duration(milliseconds: sec), () {
    click();
  });
}

 // List<TaskItem> homeList = [
 //  TaskItem.normal("Current Booking",
 //      codePreview:
 //          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjwd7wnti2W1bOMH9lfMtYpSm08xTJir272A&usqp=CAU',
 //      icon: Icons.receipt_rounded,
 //      bgColor: Colors.deepPurple.shade100),
 //  TaskItem.normal("Upcoming Booking",
 //      codePreview:
 //          'https://freepngimg.com/thumb/bike/23104-9-hero-bike-transparent-background-thumb.png',
 //      icon: Icons.upcoming_outlined,
 //      bgColor: Colors.deepOrange.shade100),
 //  TaskItem.normal("History",
 //      codePreview:
 //          'https://i.pinimg.com/736x/d8/aa/a0/d8aaa0207adf0fa4bda9860b7ad748d5.jpg',
 //      icon: Icons.history_edu_sharp,
 //      bgColor: Colors.green.shade100),
 //  TaskItem.normal("Due Penalties",
 //      codePreview:
 //          'https://assets.stickpng.com/images/580b585b2edbce24c47b2beb.png',
 //      icon: Icons.pending_actions,
 //      bgColor: Colors.lightGreenAccent.shade100),
 //  TaskItem.normal("Service (fleet)",
 //      codePreview:
 //          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIWTDj3wLQBeN9PNPtJ0sOC1LS_x8LNtw1YA&usqp=CAU',
 //      icon: Icons.home_repair_service_outlined,
 //      bgColor: Colors.teal.shade100),
 //  TaskItem.normal("Statics",
 //      codePreview:
 //          'https://www.pngfind.com/pngs/m/356-3562780_tata-10-wheeler-truck-hd-png-download.png',
 //      icon: Icons.data_usage_sharp,
 //      bgColor: Colors.amber.shade100),
 //  TaskItem.normal("Notice Board",
 //      codePreview:
 //          'https://www.pngfind.com/pngs/m/356-3562780_tata-10-wheeler-truck-hd-png-download.png',
 //      icon: Icons.notification_important_outlined,
 //      bgColor: Colors.cyanAccent.shade100),
 //
 // ];

