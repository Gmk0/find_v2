import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/controller/UserController.dart';
import 'package:find_v2/model/userModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:find_v2/views/profile/widgets/_ProfileHeaderDelegate.dart';

class ProfileUser extends GetView<UserController> {
  // Add a variable to hold the user's profile picture (replace with your image path)
  final String userPicture = 'path/to/user/picture.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: SingleChildScrollView(
              // Allow scrolling for long profiles
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // List of profile sections
                    buildProfileSections(),

                    // Divider line
                    const Divider(thickness: 1),

                    // Logout button
                    buildLogoutButton(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomSheet: BottomNav(),
    );
  }

  // Build profile sections list
  Widget buildProfileSections() {
    return Column(
      children: [
        ListTile(
          title: const Text('Edit Profile'),
          leading: const Icon(Icons.edit),
          onTap: () {
            // Handle edit profile action (navigation to edit screen)
          },
        ),
        ListTile(
          title: const Text('Orders'),
          leading: const Icon(Icons.list),
          onTap: () {
            // Handle view orders action (navigation to orders screen)
          },
        ),
        ListTile(
          title: const Text('Transactions'),
          leading: const Icon(Icons.monetization_on),
          onTap: () {
            // Handle view transactions action (navigation to transactions screen)
          },
        ),
        // Add more list tiles for other sections
      ],
    );
  }

  // Build logout button
  Widget buildLogoutButton() {
    return ElevatedButton(
      onPressed: () {
        controller.logout();
      },
      child: const Text('Logout'),
    );
  }
}

// Classe pour définir le delegate de l'en-tête persistant
