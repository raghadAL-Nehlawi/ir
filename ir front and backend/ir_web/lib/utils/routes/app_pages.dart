
import 'package:get/get.dart';
import 'package:ir_wed/views/home/home_binding.dart';
import 'package:ir_wed/views/home/home_pages/home_page.dart';

import '../../views/home/home.dart';


part './app_routes.dart';

class AppPages {
  List<GetPage> getPages() {
    return [

      //GetPage(name: AppRoutes.SPLASH, page: () => SplashScreenPage(), binding: SplashScreenBinding()),
      GetPage(name: AppRoutes.HOME, page: () => Home(), binding: HomeBinding()),

    ];
  }


}
