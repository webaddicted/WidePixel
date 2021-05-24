import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallpaper/data/controller/HomeController.dart';
import 'package:wallpaper/utils/constant/ColorConst.dart';

class HomePage extends GetView<HomeController>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.WHITE_COLOR,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 70),
                  child: CircularProgressIndicator(
                    valueColor:
                        new AlwaysStoppedAnimation<Color>(ColorConst.APP_COLOR),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
