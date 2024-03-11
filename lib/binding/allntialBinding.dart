import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:get/get.dart';

class AllIntialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<CategoryController>(() => CategoryController());
    //Get.lazyPut<ServiceController>(() => ServiceController());
    Get.put<PageControllerView>(PageControllerView());
    Get.put<ChatController>(ChatController());
  }
}
