import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool? isLogin = sp.getBool('isLogin') ?? false;

    if (isLogin) {
      Timer(const Duration(seconds: 5), () {
        Get.offAndToNamed(
          '/home',
        );
      });
    } else {
      Timer(const Duration(seconds: 5), () {
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
