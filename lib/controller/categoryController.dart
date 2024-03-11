import 'dart:convert';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  var category = <CategoryModel>[].obs;

  @override
  void onInit() {
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
}
