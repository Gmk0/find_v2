import 'dart:convert';

import 'package:find_v2/model/userModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:find_v2/views/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordConfirmation = TextEditingController();

  TextEditingController telephone = TextEditingController();
  TextEditingController parainage = TextEditingController();
  TextEditingController terms = TextEditingController();

  var user = UserModel(
    id: '',
    name: '',
    email: '',
    phone: '',
    slug: '',
    referralCode: '',
    emailVerifiedAt: '',
    profilePhotoPath: '',
    lastActivity: '',
    isOnline: true,
  ).obs;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> login() async {
    try {
      final url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.loginEmail);
      final body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };
      http.Response response = await http.post(url,
          body: jsonEncode(body), headers: await ApiEndPoints.getHeaders());

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        var userData = json['user'];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        await prefs.setBool('isLogin', true);
        await fillUserModel(userData);

        emailController.clear();
        passwordController.clear();
        Get.off(const HomeScreen(), transition: Transition.fadeIn);
      } else {
        Map responseMap = jsonDecode(response.body);

        String errorMessage = responseMap['message'];
        Get.snackbar('Erreur', errorMessage,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 6));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> register() async {
    try {
      final url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoints.registerEmail);
      final body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'phone': telephone.text,
        'password': passwordController.text,
        'confirm_password': passwordConfirmation.text,
        'referral_code': parainage.text,
        'terms': terms.text,
      };
      http.Response response = await http.post(url,
          body: jsonEncode(body), headers: await ApiEndPoints.getHeaders());
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var token = json['token'];
        var userData = json['user'];

        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);
        await prefs.setBool('isLogin', true);

        emailController.clear();
        passwordController.clear();
        await fillUserModel(userData);

        Get.off(const HomeScreen(), transition: Transition.fadeIn);
      } else if (response.statusCode == 422) {
        Map responseMap = jsonDecode(response.body);
        String errorMessage = '';
        if (responseMap.containsKey('message')) {
          errorMessage = 'Erreurs : \n';
          responseMap['message'].forEach((key, value) {
            if (value is List) {
              errorMessage += ' - $key : \n';
              value.forEach((error) => errorMessage += '    * $error\n');
            } else {
              errorMessage += ' - $key : $value\n';
            }
          });
        }
        Get.snackbar(
          'Erreur',
          errorMessage,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6),
          backgroundColor: Colors.white,
          borderColor: Colors.red,
          borderWidth: 2.0,
        );
      } else {
        Map responseMap = jsonDecode(response.body);

        String errorMessage = responseMap['message'];
        Get.snackbar('Erreur', errorMessage,
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 6));
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> fillUserModel(Map<String, dynamic> userData) async {
    user.value = UserModel.fromJson(userData);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userData', jsonEncode(userData));
  }
}
