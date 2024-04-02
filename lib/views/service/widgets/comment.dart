import 'package:find_v2/components/backgroundComponent.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/service/AllComment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsService extends StatelessWidget {
  CommentsService({Key? key}) : super(key: key);

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
    return Container(
        //decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Commentaires',
                style: TextStyle(
                  // color: Colors.grey,
                  fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => AllComment());
                  // Action à effectuer lors du clic sur le bouton "Voir plus"
                },
                child: Text('Voir plus'),
              ),
            ],
          )),
      Container(
        // height: 150,
        constraints: BoxConstraints(minHeight: 150, maxHeight: 200),
        padding: EdgeInsets.all(10),
        // Hauteur ajustée pour la liste des commentaires
        child: ListView.builder(
          itemCount: comments.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            Map<String, dynamic> comment = comments[index];
            // Construction de chaque élément de la liste de commentaires
            return Container(
              constraints: BoxConstraints(maxWidth: 300),
              child: ThemedContainer(
                // decoration: const BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                //elevation: 2,
                margin: EdgeInsets.all(10),

                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(images[0]),
                          ),
                          SizedBox(width: 8),
                          Text(comment["user"]),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(comment["text"]),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(comment["rating"].toString()),
                          SizedBox(width: 8),
                          Text(
                            comment["date"].toString(),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      SizedBox(height: 16),
    ]));
  }
}
