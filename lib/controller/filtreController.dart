import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/tools/classFiltre.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController {
  // Observables pour les filtres
  var levelFilter = <String>[].obs;
  var isPopularFilter = ''.obs;
  TextEditingController searchFiltre = TextEditingController();

  var deliveryTimeFilter = ''.obs;
  var locationFilter = ''.obs;

  var priceFilter = RangeValues(0, 0).obs;
  List<LevelFilterListData> popularFilterListData =
      LevelFilterListData.popularFList;
  List<TimeDeliveyFilteListData> timeDeliveyFilteListData =
      TimeDeliveyFilteListData.listDelivery;
  List<LocalisationFreelance> localisationFreelanceData =
      LocalisationFreelance.listeVille;

  var isOnlineFilter = false.obs;

  void resetFilters() {
    levelFilter.clear();
    isPopularFilter.value = '';
    deliveryTimeFilter.value = '';
    locationFilter.value = '';
    isOnlineFilter.value = false;
    priceFilter.value = RangeValues(0, 0);
    resetLevel();
  }

  void updatePriceFilter(RangeValues values) {
    // Mettre à jour la propriété priceFilter avec les valeurs de l'intervalle de prix
    priceFilter.value = values;
    print(priceFilter);
  }

  // Méthodes pour mettre à jour les filtres
  void updateLevelFilter(String value) {
    if (levelFilter.contains(value)) {
      levelFilter.remove(value);
    } else {
      levelFilter.add(value);
    }
  }

  bool verififLevelFilter(String value) {
    if (levelFilter.contains(value)) {
      return true;
    } else {
      return false;
    }
  }

  void updatePopularFilter(String value) {
    isPopularFilter.value = value;
  }

  void updateSearchFiltre(String value) {
    searchFiltre = value as TextEditingController;

    print('value: ' + value);
  }

  void updateDeliveryTimeFilter(String value) {
    deliveryTimeFilter.value = value;
  }

  void updateLocationFilter(String value) {
    locationFilter.value = value;
  }

  void updateIsOnlineFilter(bool value) {
    isOnlineFilter.value = value;
  }

  void resetLevel() {
    for (var item in popularFilterListData) {
      item.reset();
    }
  }

  void getSubCategory(List<SubCategoryModel> values) {
    values.map((e) => {print(e.id)});
  }
}
