import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNav extends GetView<PageControllerView> {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          //color: const Color(0xfff6f8ff),
          child: Container(
            //margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    //color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              child: BottomNavigationBar(
                selectedItemColor: skinFill,
                currentIndex: controller.selectedIndex.value,
                onTap: (index) {
                  controller.setSelectedIndex(index);
                },
                selectedFontSize: 11,
                unselectedFontSize: 11,
                unselectedItemColor: Colors.grey.withOpacity(0.7),
                type: BottomNavigationBarType.fixed,
                items: [
                  const BottomNavigationBarItem(
                    label: 'home',
                    icon: Icon(
                      Icons.home_rounded,
                      size: 25,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "message",
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        //color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.message,
                        size: 20,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "search",
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        //color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.search,
                        size: 20,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Commande",
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        // color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.task_alt,
                        size: 20,
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "Utilisateur",
                    icon: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        // color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        //Get.off(HomeScreen(), transition: Transition.fade);
        break;
      case 1:
        //Get.to(MessageUser());
        break;
      case 2:
        //Get.to(MessageUser(), transition: Transition.fade);
        break;
      // Ajoutez d'autres cas pour d'autres pages si nécessaire
    }
  }
}
