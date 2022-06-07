import 'package:get/get.dart';
import '../widgets/app_text_field.dart';
import 'home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.create<AppTextFieldController>(() => AppTextFieldController());

  }

}