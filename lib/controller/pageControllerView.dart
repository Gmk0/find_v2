import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/views/ChatUser/ChatPage.dart';
import 'package:find_v2/views/Test.dart';
import 'package:find_v2/views/home/HomePage.dart';
import 'package:find_v2/views/home/searchPageAll.dart';
import 'package:find_v2/views/home/widgets/HomeSearch.dart';
import 'package:find_v2/views/order/liste_order.dart';
import 'package:find_v2/views/profile/profile.dart';
import 'package:get/get.dart';

class PageControllerView extends GetxController {
  var selectedIndex = 0.obs;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    _navigateToPage(index);
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        Get.to(() => HomePage(), transition: Transition.fade);
        break;
      case 1:
        Get.to(() => ChatPage(), transition: Transition.fadeIn);
        break;
      case 2:
        Get.to(() => HomeSearch(), transition: Transition.fadeIn);
        break;
      case 3:
        Get.to(() => ListeOrder(), transition: Transition.fade);
        break;
      case 4:
        Get.to(() => Profile(), transition: Transition.fade);
        break;
      // Ajoutez d'autres cas pour d'autres pages si nécessaire
    }
  }

  Future<void> loadEssential() async {
    AllIntialBinding().dependencies();
  }
}
