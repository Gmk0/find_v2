import 'package:find_v2/components/FreelanceCard.dart';
import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/appStyle.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/views/freelance/allFreelance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FreelancePopular extends StatelessWidget {
  FreelancePopular({Key? key}) : super(key: key);

  ServiceController controller = Get.find<ServiceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.freelancesAll.isEmpty) {
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
                    text: "Freelance Populaire",
                    size: 15,
                    fw: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => AllFreelance());
                      // Action à effectuer lorsque "View All" est cliqué
                    },
                    child: ReusableText(
                      text: "Voir Tout",
                      style: appStyle(
                        14,
                        Colors.blue, // Couleur du texte "Voir Tout"
                        FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxHeight: 280.h,
                minHeight: 260.h,
              ),
              width: double.infinity,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (((context, index) =>
                    FreelanceCard(controller.freelancesAll[index]))),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 20,
                ),
                itemCount: controller.freelancesAll.length,
              ),
            )
          ],
        );
      }
    });
  }
}
