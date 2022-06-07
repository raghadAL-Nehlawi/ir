import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

AppBar getAppBar(String title){
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Text(title),
    elevation: 0,
      leading: InkWell(
        child: SvgPicture.asset("assets/images/back.svg"),
        onTap: () => Get.back(),
      )
  );
}