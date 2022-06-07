import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTextFieldController extends GetxController {
  RxBool _obscureText = true.obs;
  RxBool _valid = true.obs;

  get obscureText => _obscureText.value;

  get toggleObscureText => _obscureText.toggle();

  get valid => _valid.value;

  set valid(val) => _valid.value = val;
}

class AppTextField extends GetWidget<AppTextFieldController> {
  final String labelText;
  final TextInputType keyboardType;
  final double height;
  final bool required;
  final bool withValidation;
  final bool readOnly;
  final TextEditingController? textController;
  final String? invalidText;
  final int maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  String? hint;
  TextStyle? style;
  BoxDecoration? decoration;
  final Function? onSubmit;

  AppTextField(
      this.labelText, {
        this.keyboardType = TextInputType.text,
        this.height = 45,
        this.required = false,
        this.withValidation = false,
        this.readOnly = false,
         this.textController,
        this.invalidText,
        this.maxLines = 1,
         this.prefixIcon,
        this.style,
        this.hint,
        this.decoration,
        this.suffixIcon,
        this.onSubmit
      }){
    if(withValidation){
      assert(keyboardType != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    if(style == null)
      style = TextStyle(color: Colors.grey);
    return Obx(
          () => Container(
            height: height + 20,
              width: Get.width,
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: decoration ?? BoxDecoration(
                    border: Border.all(color:  Color(0xFFF3F3F3)),
                      color:Color(0xFFF3F3F3)
    ,
                      borderRadius: BorderRadius.circular(8)

                  ),
                height: height,
                 width: Get.width,
                 child: TextField(
                    maxLines: maxLines,
                    controller: textController,
                    onSubmitted: (value) {
                      onSubmit!();
                      if (!withValidation) return;
                      if (value.isEmpty) return;
                      if (keyboardType == TextInputType.visiblePassword) {
                        if (GetUtils.isLengthLessThan(value, 8)) {
                          controller.valid = false;
                        } else {
                          controller.valid = true;
                        }
                      }
                      else if (keyboardType == TextInputType.emailAddress)
                      {
                        if (value.isEmail) {
                          controller.valid = true;
                        } else {
                          controller.valid = false;
                        }
                      }
                    },

                    style: style,
                    keyboardType: keyboardType,
                    readOnly: readOnly,
                    obscureText: keyboardType == TextInputType.visiblePassword ? controller.obscureText : false,
                    decoration: InputDecoration(
                      hintStyle: style,
                      labelText: labelText,
                      labelStyle: controller.valid ? style : style,
                      prefixIcon: prefixIcon ,
                      suffixIcon: suffixIcon,
                      hintText: hint,
                      contentPadding: EdgeInsetsDirectional.only(start: 15, end: 12, top: 20, bottom: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8)),
                    ),
              ),

            ),
            ]),
          ),
    );
  }
}
