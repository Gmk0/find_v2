import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget {
  const HomeSearch({super.key});

  @override
  State<HomeSearch> createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Rechercher...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), // Bordure arrondie
              borderSide:
                  BorderSide(color: Colors.black12), // Couleur de la bordure
            ),
            filled: true, // Rempli de couleur de fond
            fillColor: Colors.white, // Couleur de fond
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5, horizontal: 10), // Espacement interne
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              Navigator.pop(context); // Retourne en arrière
            },
          ),
        ],
      ),
      body: Container(), // Corps de la page
    );
  }

  @override
  void dispose() {
    _searchController
        .dispose(); // Libère la mémoire lorsque le widget est détruit
    super.dispose();
  }
}
