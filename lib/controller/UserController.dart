import 'dart:convert';

import 'package:find_v2/controller/pageControllerView.dart';
import 'package:find_v2/model/userModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  var userGet = UserModel(
    id: '',
    name: '',
    email: '',
    phone: '',
    slug: '',
    referralCode: '',
    emailVerifiedAt: '',
    profilePhotoPath: '',
    lastActivity: '',
    //isOnline: true,
  ).obs;

  // Getter pour l'utilisateur connecté
  //Type get user => _user;

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  /// Fonction pour récupérer l'utilisateur connecté à partir du token
  Future<void> fetchUser() async {
    try {
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.fetchUser);
      http.Response response =
          await http.get(url, headers: await ApiEndPoints.getHeaders());

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        userGet.value = UserModel.fromJson(responseData);
      } else {
        // Gérer l'erreur de récupération de l'utilisateur
        print('Error fetching user: Status code ${response.statusCode}');

        await clearUserData();

        // Rediriger vers la page de connexion
        Get.offAllNamed('/getStarted');
      }
    } catch (error) {
      // Gérer l'erreur de réseau
      print('Error fetching user: $error');
    }
  }

  /// Fonction pour déconnecter l'utilisateur
  void logout() async {
    try {
      var url =
          Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.logout);
      http.Response response =
          await http.get(url, headers: await ApiEndPoints.getHeaders());

      if (response.statusCode == 200) {
        //_user = Rxn<UserModel>();

        await clearUserData();

        // Rediriger vers la page de connexion
        Get.offAllNamed('/getStarted');
      } else {
        // Gérer l'erreur de déconnexion
        print('Error logging out: Status code ${response.statusCode}');
      }
    } catch (error) {
      // Gérer l'erreur de réseau
      Get.snackbar('Erreur', error.toString(),
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
      print('Error logging out: $error');
    }
  }

  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.delete<PageControllerView>();

    // Clear all stored data
    // OR
    // await prefs.remove('tokenKey'); // Remove specific token (replace 'tokenKey' with your actual key)
  }
}
