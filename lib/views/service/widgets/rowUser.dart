import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/freelance/oneFreelance.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class RowUser extends StatelessWidget {
  const RowUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(images[
                      0]), // Remplacez l'image par celle de l'utilisateur
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gmk',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      'Niveau de l\'utilisateur',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                showStickyFlexibleBottomSheet(
                  minHeight: 0.5,
                  initHeight: 0.7,
                  maxHeight: 0.9,
                  headerHeight: 100.0,
                  context: context,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  //backgroundColor: Colors.white,
                  headerBuilder: (BuildContext context, double offset) {
                    // Build your header content here
                    return header();
                  },
                  bodyBuilder: (BuildContext context, double offset) {
                    return SliverChildListDelegate([
                      _body(),
                    ]);
                  },
                  anchors: [0.0, 0.5, 0.9],
                );
// Action à effectuer lors du clic sur le bouton
                // Vous devez implémenter cette méthode pour afficher le BottomSheet
              },
              icon: Icon(Icons.remove_red_eye_rounded),
            ),
          ],
        ));
  }

  Widget header() {
    return Container(
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30, // Ajustez la taille du cercle en conséquence
                backgroundImage: NetworkImage(
                    images[0]), // Remplacez l'image par celle de l'utilisateur
              ),
              SizedBox(width: 10), // Espace entre l'image et le texte
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gmk',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Niveau freelance',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {
// Action à effectuer lors du clic sur le bouton
              // Vous devez implémenter cette méthode pour afficher le BottomSheet
            },
            icon: Icon(Icons.message_outlined),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description du freelance :',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          ReadMoreText(
            'Description du service. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet pretium urna. Donec aliquam neque ac tortor aliquam, sed ultricies eros ultricies. Fusce tincidunt massa sit amet neque tincidunt, sed tincidunt elit ultricies. Nam eget nibh euismod, tincidunt libero a, ultrices diam. Maecenas eget lacus ut enim hendrerit ultricies. Maecenas sit amet lectus euismod, ultricies risus eget, ultricies nibh.',
            trimLines: 4,
            colorClickableText: const Color(0xFF5F67EA),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Plus',
            trimExpandedText: ' Réduire',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              height: 1.5,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Détails du freelance :',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 20),
          _rowWithIcon('Catégorie : Nom de la catégorie', Icons.category),
          _rowWithIcon('Temps de réponse : 24 heures', Icons.access_time),
          _rowWithIcon('Localisation : Ville, Pays', Icons.location_on),
          _rowWithIcon('Taux journalier : \$100', Icons.attach_money),
          _rowWithIcon('Langue : Français, Anglais', Icons.language),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                //Get.to(UserProfilePage(freelance: ,), transition: Transition.fadeIn);
              },
              child: Text('Voir le profil complet'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowWithIcon(String text, IconData icon) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16),
            SizedBox(width: 10),
            Text(text),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
