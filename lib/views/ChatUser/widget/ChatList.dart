// ignore: file_names
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';

class ChatListComponenent extends GetView<ChatController> {
  const ChatListComponenent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return SwipeActionCell(
          key:
              UniqueKey(), // Assurez-vous d'avoir une clé unique pour chaque élément
          leadingActions: <SwipeAction>[
            SwipeAction(
              performsFirstActionWithFullSwipe: true,
              content:
                  Icon(Icons.mark_email_read), // Icône pour marquer comme lu
              onTap: (context) {
                // Action de marquage comme lu
              },
              color: Colors.green, // Couleur de l'action
            ),
          ],
          trailingActions: <SwipeAction>[
            SwipeAction(
              performsFirstActionWithFullSwipe: true,
              content: Icon(Icons.more_horiz), // Icône pour plus d'options
              onTap: (index) {
                // Afficher le BottomSheet avec d'autres options
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          height: 50,
                        ),
                        ListTile(
                          leading: Icon(Icons.archive), // Icône pour archiver
                          title: Text('Archiver'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                              Icons.mark_email_read), // Icône pour archiver
                          title: Text('Marquer comme lue'),
                          onTap: () {},
                        ),
                        // Ajoutez d'autres options ici
                      ],
                    );
                  },
                );
              },
              color: Colors.green, // Couleur de l'action
            ),
            SwipeAction(
              content: Icon(Icons.archive), // Icône pour archiver
              onTap: (context) {
                // Action d'archivage
              },
              color: Colors.red, // Couleur de l'action
            ),
          ],
          child: ListTile(
            // Contenu de votre ListTile
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/images/ff3.png"), // Chemin de l'image de l'utilisateur
            ),
            title: Text(
              'Georeges', // Nom de l'utilisateur
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'dernier message', // Dernier message
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(
              '12/02/234', // Heure du dernier message
            ),
            onTap: () {
              //Get.to(const ChatBody());
            },
          ),
        );
      },
    );
  }
}
