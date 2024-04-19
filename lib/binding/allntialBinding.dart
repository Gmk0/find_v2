import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/controller/UserController.dart';
import 'package:find_v2/controller/categoryController.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/controller/filtreController.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/controller/pusherController.dart';
import 'package:get/get.dart';

class AllIntialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<PusherController>(PusherController());

    //Get.lazyPut<ServiceController>(() => ServiceController());
    Get.put<AuthController>(AuthController());
    Get.lazyPut<CategoryController>(() => CategoryController());
    Get.put<PageControllerView>(PageControllerView());
    Get.lazyPut<ChatController>(() => ChatController());
    // Get.put<PusherController>(PusherController());
    //Get.lazyPut<ChatController>(() => ChatController());

    //Get.lazyPut<UserController>(() => UserController());
    Get.put<FilterController>(FilterController());
  }

  // Méthode pour charger les dépendances
  Future<void> loadDependencies() async {
    //Get.lazyPut<CategoryController>(() => CategoryController());
    //Get.lazyPut<ServiceController>(() => ServiceController());
    //Get.put<PageControllerView>(PageControllerView());
    Get.lazyPut<ChatController>(() => ChatController());
    // Get.put<PusherController>(PusherController());

    //   Get.lazyPut<PusherController>(() => PusherController());

    // Ajoutez ici d'autres dépendances...
  }
}
