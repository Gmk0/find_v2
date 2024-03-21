import 'dart:convert';

import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  var serviceAll = <ServiceModel>[].obs;
  var servicePopular = <ServiceModel>[].obs;
  var freelancesAll = <FreelanceModel>[].obs;

  @override
  void onInit() {
    fetchAllServices();
    fetchAllFreelances();
    super.onInit();
  }

  Future<void> fetchAllServices() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.serviceEndPoints.allService);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData =
            jsonDecode(response.body)['services'] as List<dynamic>;

        print(responseData);
        serviceAll.value =
            responseData.map((data) => ServiceModel.fromJson(data)).toList();
      }
    } catch (e) {
      Get.snackbar('Erreur', e.toString(),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
      print(e.toString());
    }
  }

  Future<void> fetchAllFreelances() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.freelanceEndPoints.allFreelance);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData =
            jsonDecode(response.body)['allfreelances'] as List<dynamic>;

        print(responseData);
        freelancesAll.value =
            responseData.map((data) => FreelanceModel.fromJson(data)).toList();
      }
    } catch (e) {
      Get.snackbar('Erreur', e.toString(),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
      print(e.toString());
    }
  }

  // Méthode pour récupérer les services d'une catégorie spécifique
  List<ServiceModel> getServicesByCategory(CategoryModel category) {
    // Filtrer les services en fonction de l'ID de la catégorie
    return serviceAll
        .where((service) => service.categoryId == category.id)
        .toList();
  }

  List<ServiceModel> getServicesBySousCategorie(
      SubCategoryModel? subCategoryModel) {
    if (subCategoryModel == null || subCategoryModel.id == null) {
      // La sous-catégorie est nulle ou son ID est nul, donc on retourne une liste vide
      return [];
    }

    serviceAll
        .where((service) =>
            service.subCategory?.contains(subCategoryModel.id) ?? false)
        .toList();
    print(serviceAll);
    return serviceAll;
  }
}
