import 'package:flutter/material.dart';

Widget buildBottomSheet(BuildContext context, Widget build) {
  return Container(
    // Contenu du bottom sheet de filtrage
    child: Stack(
      children: [
        // Header du bottom sheet
        Positioned(
          left: 5,
          right: 5,
          top: 20,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Croix pour fermer le bottom sheet
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // Bouton pour effacer les filtres
                ElevatedButton(
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton pour effacer les filtres
                  },
                  child: Text('Effacer les filtres'),
                ),
              ],
            ),
          ),
        ),

        // Contenu principal du bottom sheet
        Positioned.fill(
          top: kToolbarHeight, // Pour laisser de l'espace pour le header
          child: build,
        ),

        // Bouton pour afficher les résultats
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton pour afficher les résultats
              },
              child: Text('Afficher les résultats'),
            ),
          ),
        ),
      ],
    ),
  );
}
