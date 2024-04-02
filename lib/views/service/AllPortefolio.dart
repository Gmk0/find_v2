import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';

// Définition de la classe Artwork pour représenter une œuvre
class Artwork {
  final String imageUrl;
  final String description;

  Artwork({
    required this.imageUrl,
    required this.description,
  });
}

class AllPortefolio extends StatelessWidget {
  // Liste d'exemple d'œuvres
  final List<Artwork> artworks = [
    Artwork(
      imageUrl: 'https://example.com/image1.jpg',
      description: 'Description de l\'œuvre 1',
    ),
    Artwork(
      imageUrl: 'https://example.com/image2.jpg',
      description: 'Description de l\'œuvre 2',
    ),
    Artwork(
      imageUrl: 'https://example.com/image3.jpg',
      description: 'Description de l\'œuvre 3',
    ),
    // Ajoutez autant d'œuvres que vous le souhaitez
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Portefolio'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10),
            color: Colors.white,
            child: Text(
              'Oeuvres du Freelance',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 30),
          Expanded(
            child: GridView.builder(
              itemCount: artworks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Action à effectuer lors du clic sur une œuvre
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            artworks[index].description,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
