import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/controller/UserController.dart';
import 'package:find_v2/controller/categoryController.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/controller/filtreController.dart';
import 'package:get/get.dart';

class AllIntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ServiceController>(() => ServiceController());
    Get.put<PageControllerView>(PageControllerView());
    Get.put<ChatController>(ChatController());
    //Get.lazyPut<ChatController>(() => ChatController());
    //Get.lazyPut<UserController>(() => UserController());
    Get.put<FilterController>(FilterController());
  }

  // Méthode pour charger les dépendances
  Future<void> loadDependencies() async {
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.lazyPut<ServiceController>(() => ServiceController());
    //Get.put<PageControllerView>(PageControllerView());
    Get.lazyPut<ChatController>(() => ChatController());
    Get.lazyPut<UserController>(() => UserController());
    // Ajoutez ici d'autres dépendances...
  }
}
