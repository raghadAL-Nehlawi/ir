import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchButtonController extends GetxController {
  RxBool _on = false.obs;
  SwitchButtonController({bool ison = false}) {

    this._on = ison.obs;
  }

  get isOn => _on.value == true;

  get toggle => _on.toggle();

  get on => _on.value = true;

  get off => _on.value = false;
}

class AppSwitchButton extends StatelessWidget {
  final SwitchButtonController controller;
  final Function onChange;

  const AppSwitchButton({required this.controller, required this.onChange});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Switch(
          onChanged: (val) {
            controller.toggle();
          onChange(val);
          },
          value: controller.isOn,
          activeColor: Colors.blue[400],
          activeTrackColor: Colors.blue[50],
          inactiveThumbColor: Colors.grey[400],
          inactiveTrackColor: Colors.grey,
        ));
  }
}
