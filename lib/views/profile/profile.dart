import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/profile/compte_setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final String userPicture = 'path/to/user/picture.jpg';

  var user = Get.find<AuthController>().user.value;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: 200.h,
                child: AppBar(
                  backgroundColor: Colors.blue, // Couleur de fond de l'AppBar
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        // Gérer l'appui sur l'icône de notification
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: buildProfileSections2(context),
                ),
              ),
            ],
          ),
          Positioned(
            top: 70.h, // Ajustez cette valeur pour positionner le profil
            left: 20.0,
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(images[0]),
                  radius: 50.h,
                ),
                SizedBox(width: 10), // Espacement entre la photo et le nom
                Text(
                  user.name,
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildProfileSections2(context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return [
      const Padding(
        padding: EdgeInsets.all(10),
        child: TextComponent(
          text: 'Profile',
          size: 15,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionGroup('Mes transactions', Icons.monetization_on, () {}),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Divider(height: 5),
            ),
            buildSectionGroup('Mes Commandes', Icons.shopping_cart, () {}),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Divider(height: 5),
            ),
            buildSectionGroup('Missions', Icons.assignment, () {}),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Divider(height: 5),
            ),
            buildSectionGroup('Parainage', Icons.group, () {}),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.all(10),
        child: TextComponent(
          text: 'Parametres',
          size: 15,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            buildSectionGroup('Mes Preferences', Icons.settings, () {}),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Divider(height: 5),
            ),
            buildSectionGroup('Compte', Icons.account_circle, () {
              Get.to(CompteSetting());
            }),
          ],
        ),
      ),
      const SizedBox(height: 20),
      const Padding(
        padding: EdgeInsets.all(10),
        child: TextComponent(
          text: 'Resources',
          size: 15,
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            buildSectionGroup('Support', Icons.help, () {}),
            Container(
              padding: EdgeInsets.only(left: width * 0.14),
              child: Divider(height: 5),
            ),
            buildSectionGroup('Community and legal', Icons.gavel, () {}),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Center(
        child: Text('version 11'),
      ),
      SizedBox(
        height: 20,
      ),
    ];
  }

  // Méthode pour créer un groupe de section avec une icône et une action
  Widget buildSectionGroup(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      title: TextComponent(
        text: title,
        size: 14,
      ),
      leading: Icon(icon),
      onTap: onTap,
      trailing: Icon(Icons.arrow_forward_ios, size: 15),
    );
  }
}
