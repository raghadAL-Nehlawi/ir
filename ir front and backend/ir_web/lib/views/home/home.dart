
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'home_pages/home_page.dart';


class Home extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
              child: HomePage()

      ),
    );
  }
}
