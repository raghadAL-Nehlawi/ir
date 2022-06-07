import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:ir_wed/utils/routes/app_pages.dart';
import 'package:ir_wed/utils/themes.dart';
import 'package:ir_wed/views/home/home_binding.dart';


void main() async{

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      title: 'search',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 3),
      getPages: AppPages().getPages(),
      initialRoute: AppRoutes.HOME,
      initialBinding: HomeBinding(),
    );
  }
}
