import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:find_v2/components/backgroundComponent.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AllComment extends StatefulWidget {
  const AllComment({Key? key}) : super(key: key);

  @override
  State<AllComment> createState() => _AllCommentState();
}

class _AllCommentState extends State<AllComment> {
  List<FilterButton> filterButtons = [
    FilterButton(label: 'Plus noté'),
    FilterButton(label: 'Moins noté'),
    FilterButton(label: 'Les plus récents'),
    FilterButton(label: 'Les plus anciens'),
  ];
  List<Map<String, dynamic>> comments = [
    {
      "user": "John",
      "profilePicture": "assets/john.png",
      "text": "Super service !",
      "rating": 5,
      "date": DateTime.now(),
    },
    {
      "user": "Alice",
      "profilePicture": "assets/alice.png",
      "text":
          "Très professionnel de maniere que ca puisse permetre. de faire des choise",
      "rating": 4,
      "date": DateTime.now(),
    },
    {
      "user": "Alice",
      "profilePicture": "assets/alice.png",
      "text": "Très professionnel.",
      "rating": 4,
      "date": DateTime.now(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Commentaires'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showFlexibleBottomSheet(
                  minHeight: 0.5,
                  initHeight: 0.5,
                  maxHeight: 0.5,
                  context: context,
                  builder: _buildBottomSheet,
                  isExpand: false,
                );
              },
              icon: Icon(Icons.sort_outlined))
          // Ici, vous pouvez ajouter un bouton ou une icône pour ajouter un commentaire
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Moyenne des notes du freelance
            // Moyenne des notes du freelance
            ThemedContainer(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.all(10),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes moyennes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Note de communication
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Communication : ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          // Ici, vous pouvez utiliser une fonction pour afficher les étoiles en fonction de la note moyenne de communication
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text('4.0')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Note des services
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Services : ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          // Ici, vous pouvez utiliser une fonction pour afficher les étoiles en fonction de la note moyenne des services
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text('4.0')
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  // Note des prestations
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Prestations : ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 5),
                          Text('4.0')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Liste des commentaires
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> comment = comments[index];
                return Card(
                  //color: Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(images[0]),
                                  radius: 20,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment['user'],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 4),
                                    // Ajoutez ici un widget pour afficher la note du commentaire
                                    Row(
                                      children: [
                                        Icon(Icons.star,
                                            color: Colors.yellow, size: 16),
                                        SizedBox(width: 4),
                                        Text('4'),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // Ajoutez ici un widget pour afficher la date du commentaire
                            Text(
                              '2024-03-30',
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        // Affichez ici le contenu du commentaire
                        Text(
                          comment['text'],
                          style: TextStyle(fontSize: 14),
                        ),
                        // Si nécessaire, ajoutez ici un widget pour afficher la photo du service lié
                        SizedBox(height: 10),
                        // Ajoutez ici un widget pour associer le service du commentaire
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      child: Container(
          child: ListView.separated(
        itemCount: filterButtons.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              setState(() {
                // Inversez l'état de sélection du bouton
              });
            },
            title: Text(filterButtons[index].label),
          );
        },
      )),
    );
  }
}

class FilterButton {
  final String label;
  bool isSelected;

  FilterButton({required this.label, this.isSelected = false});
}
