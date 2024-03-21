import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/home/widgets/annonceHome.dart';
import 'package:find_v2/views/home/widgets/categorySwipper.dart';
import 'package:find_v2/views/home/widgets/freelancePopular.dart';
import 'package:find_v2/views/home/widgets/servicePopular.dart';
import 'package:flutter/material.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        //color: ,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          AnnonceHome(),
          CategorySwipper(),
          ServicePopular(),
          FreelancePopular(),
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: skinFill, // Couleur de fond du container
              borderRadius: BorderRadius.circular(10), // Bordures arrondies
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add_circle_outline, // Icône de besoin
                  size: 50,
                  color: Colors.white, // Couleur de l'icône
                ),
                const SizedBox(height: 20), // Espace entre l'icône et le bouton
                const Text(
                  "Besoin d'un service particulier ?", // Texte d'invitation
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), // Espace entre le texte et le bouton
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lorsque le bouton est cliqué
                  },
                  child: Text(
                    "Créer une mission", // Texte du bouton
                    style: TextStyle(
                      fontSize: 16,
                      color: skinFill,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40), // Taille du bouton
                    backgroundColor: Colors.white, // Couleur du bouton
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
          )
        ],
      ),
    );
  }
}
