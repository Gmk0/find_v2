// ignore: file_names
import 'package:find_v2/views/auth/authView.dart';
import 'package:find_v2/views/auth/register.dart';
import 'package:find_v2/views/home/homeScreen.dart';
import 'package:find_v2/views/home/searchPageAll.dart';
import 'package:find_v2/views/launch/SplashScreen.dart';
import 'package:find_v2/views/launch/getStarted.dart';
import 'package:get/get.dart';

class AppRoute {
  static final routes = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/login', page: () => const SignInView()),
    GetPage(name: '/register', page: () => const Register()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/getStarted', page: () => const GetStarted()),
    GetPage(name: '/searchAll', page: () => const SearchPageAll())
    // Ajoutez d'autres routes ici au besoin
  ];
}
