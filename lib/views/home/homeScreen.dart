import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/views/ChatUser/ChatPage.dart';
import 'package:find_v2/views/home/HomePage.dart';
import 'package:find_v2/views/home/searchPageAll.dart';
import 'package:find_v2/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final PageControllerView pageController = Get.put(PageControllerView());

  @override
  Widget build(BuildContext context) {
    // Défaut à l'index 0 ou l'élément 'Home'

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Obx(
        () => IndexedStack(
          index: pageController.selectedIndex.value,
          children: [
            const HomePage(),
            ChatPage(),
            //MessageUser(),
            SearchPageAll(),
            //OrderUser(),
            ProfileUser(),
          ],
        ),
      ),
      bottomSheet: const BottomNav(),
    );
  }
}
