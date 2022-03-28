import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widepixelimage/utils/common/InitialBinding.dart';
import 'package:widepixelimage/utils/constant/RoutersConst.dart';
import 'package:widepixelimage/utils/constant/RoutesPage.dart';
import 'package:widepixelimage/utils/constant/StringConst.dart';

void main() {
  runApp(MyApp());
  // runApp(MyApp1());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get.put(AppController());
    return GetMaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,

      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RoutersConst.initialRoute,
      getPages: RoutesPage(),
    );
  }
}


class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Click Color Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Test(),
    );
  }
}

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  var test = "hello";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(test),
          backgroundColor: const Color.fromRGBO(58, 133, 191, 1),
        ),
        body: Column(
            children: [
              Row(children: [
                Text(test),
                IconButton(
                  icon: const Icon(Icons.delete_forever),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      test = "notworking:(";

                    });
                  },
                ),
              ]),]
        ));
  }
}



