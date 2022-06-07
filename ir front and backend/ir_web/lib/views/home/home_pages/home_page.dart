import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/app_text_field.dart';
import '../home_controller.dart';

class HomePage extends GetWidget<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             padding: EdgeInsets.all(16),
             width: Get.width,
             height: 120,
             decoration:  BoxDecoration(
                 color: Theme.of(context).primaryColor,
             borderRadius: BorderRadius.only(
                 bottomLeft: Radius.circular(16),
                 bottomRight: Radius.circular(16)
             )
             ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //  SizedBox(height: 50),

                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: AppTextField(
                      "".tr,
                      prefixIcon: Icon(Icons.search),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      hint: "بحث".tr,
                      textController: controller.searchController,
                      height: 45,
                      suffixIcon: Container(
                          height: 30,
                          width: 30,
                         margin: EdgeInsets.all(6),
                          padding: EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Theme.of(context).primaryColor,borderRadius: BorderRadius.circular(12)),
                            child: Icon(Icons.find_in_page_rounded, color: Colors.white)
                          ),
                      onSubmit: controller.search,
                      ),
                    ),
              ],),
           ),
           SizedBox(height: 150,),
           if(controller.query.value.trueQuery!= null )
           InkWell(
               child: Text(
                 "do you mean" + (controller.query.value.trueQuery??''),
                 style: TextStyle(fontWeight: FontWeight.bold), )
           )
           else
             Container(
               height: Get.height,
               child: ListView.builder(
                   itemCount: controller.result.length,

                   itemBuilder: (_, index) => Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(16),
                         child: Text(controller.result[index].body!),
                       ),
                       Divider(endIndent: 10,indent: 10,)
                     ],
                   )),
             )


         ],

      ),
    );
  }
}
