import 'package:find_v2/binding/allntialBinding.dart';
import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/controller/PageControllerView.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/ChatUser/ChatPage.dart';
import 'package:find_v2/views/home/HomePage.dart';
import 'package:find_v2/views/home/searchPageAll.dart';
import 'package:find_v2/views/order/liste_order.dart';
import 'package:find_v2/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomePage(),
      const ChatPage(),
      //MessageUser(),
      const SearchPageAll(),
      const ListeOrder(),
      const Profile(),
      // Ajoutez autant de pages que vous avez besoin
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Accueil"),
        activeColorPrimary: skinFill,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.message),
        title: ("Chat"),
        activeColorPrimary: skinFill,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.search),
        title: ("Recherche"),
        activeColorPrimary: skinFill,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.list_alt),
        title: ("Order"),
        activeColorPrimary: skinFill,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profilee"),
        activeColorPrimary: skinFill,
        inactiveColorPrimary: Colors.grey,
      ),
      // Ajoutez autant d'éléments que vous avez besoin
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Défaut à l'index 0 ou l'élément 'Home'

    return Scaffold(
      // backgroundColor: Colors.grey.shade200,
      body: PersistentTabView(
        context,
        controller: _controller,
        padding: const NavBarPadding.all(10),
        navBarHeight: 50.h,

        backgroundColor: ThemeDarkBackground.getBackgroundColor(context),
        screens: _buildScreens(),
        items: _navBarsItems(),
        // autres paramètres...
      ),
    );
  }
}
