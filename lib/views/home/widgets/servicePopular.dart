import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/serviceCard.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/controller/categoryController.dart';
import 'package:find_v2/utils/theme2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicePopular extends GetView<CategoryController> {
  ServicePopular({Key? key}) : super(key: key);

  //final ServiceController controller = Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.serviceAll.isEmpty) {
        return const Center(
          child: CircularProgressIndicator(),
        ); // Afficher un indicateur de chargement si la liste est vide
      } else {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextComponent(
                    text: "Service Populaire",
                    size: 15,
                    fw: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action à effectuer lorsque "View All" est cliqué
                    },
                    child: ReusableText(
                      text: "Voir Tout",
                      style: appStyle(14, Colors.blue, FontWeight.normal),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              //height: 20.h,
              // width: 350.w,
              constraints: BoxConstraints(
                maxHeight: 320.h,
                minHeight: 260.h,
              ),
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (((context, index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    //height: 200.h, // 20% de la hauteur de l'écran
                    width: 220.w, // 60% de la largeur de l'écran
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ThemeDarkBackground.getBackgroundColor(context),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: ServiceCard(controller.serviceAll[index])))),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: controller.serviceAll.length,
              ),
            )
          ],
        );
      }
    });
  }
}
