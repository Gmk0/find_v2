import 'package:find_v2/views/auth/login.dart';
import 'package:find_v2/views/auth/register.dart';
import 'package:find_v2/views/home/homeScreen.dart';
import 'package:find_v2/views/launch/SplashScreen.dart';
import 'package:find_v2/views/launch/getStarted.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => Login()),
    GetPage(name: '/register', page: () => const Register()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/getStarted', page: () => const GetStarted()),
    // Ajoutez d'autres routes ici au besoin
  ];
}
