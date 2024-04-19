import 'dart:convert';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:find_v2/controller/filtreController.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/serviceModel.dart';

class CategoryController extends GetxController {
  var category = <CategoryModel>[].obs;
  var serviceAll = <ServiceModel>[].obs;
  var servicePopular = <ServiceModel>[].obs;
  var freelancesAll = <FreelanceModel>[].obs;

  final FilterController filterController = Get.find();

  @override
  void onInit() {
    fetchAllServices();
    fetchAllFreelances();
    fetchAllCategory();
    super.onInit();
  }

  Future<void> fetchAllCategory() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.categoryEndPoints.allCategory);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final responseData =
            jsonDecode(response.body)['categories'] as List<dynamic>;
        //print(responseData);
        category.value =
            responseData.map((data) => CategoryModel.fromJson(data)).toList();
      } else {
        print('Erreur lors de la récupération des données');
      }
    } catch (e) {
      print(e.toString());
    }
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

        freelancesAll.value =
            responseData.map((data) => FreelanceModel.fromJson(data)).toList();
      }
    } catch (e) {
      Get.snackbar('Erreur Freelance', e.toString(),
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

  List<ServiceModel> getServicesByCategory2(CategoryModel category) {
    // Filtrer les services en fonction de l'ID de la catégorie et des filtres sélectionnés
    return serviceAll.where((service) {
      // Filtrer par ID de catégorie
      if (service.categoryId != category.id) return false;

      // Filtrer par niveau de freelance
      if (filterController.levelFilter.value.isNotEmpty &&
          !filterController.levelFilter.value
              .contains(service.freelance.level.toString())) {
        return false;
      }

      // Filtrer par service populaire
      if (filterController.isPopularFilter.value.isNotEmpty &&
          service.premiumPrice !=
              (filterController.isPopularFilter.value == 'Yes')) {
        return false;
      }

      if (filterController.priceFilter.value.start >= 0 &&
          filterController.priceFilter.value.end != 0 &&
          (double.parse(service.basicPrice) <
                  filterController.priceFilter.value.start ||
              double.parse(service.basicPrice) >
                  filterController.priceFilter.value.end)) {
        return false;
      }

      // Ajoutez d'autres filtres ici si nécessaire

      return true; // Conserver ce service car il répond à tous les critères
    }).toList();
  }
}
