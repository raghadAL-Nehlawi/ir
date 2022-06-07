import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Utils {
  static final categoryItemWidth = Get.width * 0.44;
  static final categoryItemHeight = 242.0;
  static final productItemWidth = (Get.width / 2) - 22;
  static final productItemHeight = 218.0;


  static void changeStatusBarColor(Color color,
      {Brightness brightness = Brightness.dark}) {
    print('status bar changed');
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: brightness,
    ));
  }

  static void openSnackBar({String title = '', String message = ''}) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        );
  }

  static void openLoadingDialog() {
    if (Get.isDialogOpen!) return;
    Get.dialog(Container(
        alignment: Alignment.center,
        height: 100,
        width: 100,
        child: CircularProgressIndicator()));
  }


  static void closeDialog() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }


  static DateTime? currentBackPressTime;

  static Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Get.rawSnackbar(message: 'BackToExit'.tr, backgroundColor: Colors.grey);
      return Future.value(false);
    }

    SystemNavigator.pop();
    return Future.value(true);
  }

  static Options getOptions(
      {bool all = false,
      bool contentType = false,
      bool accept = false,
      bool acceptLanguage = false,
      bool withToken = false}) {
    Options options = Options(headers: {});

     if (contentType || all) {
       options.contentType = 'application/x-www-form-urlencoded';
     }
    if (accept || all) {
      options.headers!.addAll({'accept': 'application/json'});
    }

    return options;
  }
}
