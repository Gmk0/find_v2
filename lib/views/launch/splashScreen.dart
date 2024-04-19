import 'dart:async';
import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.find();
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  Future<void> loadEssential() async {
    AllIntialBinding().loadDependencies();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? _isLogin = sp.getBool('isLogin') ?? false;

    String? _token = sp.getString('token') ?? null;

    if (_isLogin && _token != null) {
      authController.fetchUser();

      loadEssential();
      Timer(const Duration(seconds: 3), () {
        Get.offAndToNamed(
          '/home',
        );
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offAndToNamed(
          '/getStarted',
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Container(
        child: Center(
          child: Image(
            height: 200,
            width: 200,
            image: AssetImage('assets/images/find_02.png'),
          ),
        ),
      ),
    );
  }
}
