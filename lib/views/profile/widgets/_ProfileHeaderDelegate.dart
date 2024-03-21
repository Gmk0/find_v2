import 'package:find_v2/model/userModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';

class ProfileHeaderDelegate extends SliverPersistentHeaderDelegate {
  //late final Widget buildUserProfile;
  final UserModel user;
  ProfileHeaderDelegate({required this.user});
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: 10), // Couleur d'arrière-plan de l'en-tête
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(appLogo),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Text(
                    user.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              // Notification icon
              GestureDetector(
                onTap: () {
                  // Action à effectuer lors du clic sur l'icône de notification
                },
                child: Icon(Icons.notifications),
              ),
              // Add user name and other details here (optional)
            ],
          )
        ],
      ),
    );
  }

  @override
  double get maxExtent => 180.0; // Hauteur maximale de l'en-tête

  @override
  double get minExtent => 170.0; // Hauteur minimale de l'en-tête

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
