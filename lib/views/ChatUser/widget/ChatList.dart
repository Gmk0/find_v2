// ignore: file_names
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatListComponent extends GetView<ChatController> {
  const ChatListComponent({Key? key}) : super(key: key);

  String formatDate(String apiDate) {
    DateTime dateNotFormater = DateTime.parse(apiDate);

    final now = DateTime.now();
    if (isSameDay(dateNotFormater, now)) {
      return 'Aujourd\'hui';
    } else if (isSameDay(dateNotFormater, now.subtract(Duration(days: 1)))) {
      return 'Hier';
    } else {
      return '${dateNotFormater.day}/${dateNotFormater.month}/${dateNotFormater.year}';
    }
  }

  String formatApiDate(String apiDate) {
    // Convertir la date de l'API en objet DateTime
    DateTime date = DateTime.parse(apiDate);

    // Formater la date au format souhaité
    var formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(date);
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final conversation = controller.conversation[index];
          return SwipeActionCell(
            key: UniqueKey(),
            leadingActions: <SwipeAction>[
              SwipeAction(
                performsFirstActionWithFullSwipe: true,
                content: Icon(Icons.mark_email_read),
                onTap: (context) {
                  // Action de marquage comme lu
                },
                color: Colors.green,
              ),
            ],
            trailingActions: <SwipeAction>[
              SwipeAction(
                performsFirstActionWithFullSwipe: true,
                content: Icon(Icons.more_horiz),
                onTap: (index) {
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
                            leading: Icon(Icons.archive),
                            title: Text('Archiver'),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(Icons.mark_email_read),
                            title: Text('Marquer comme lue'),
                            onTap: () {},
                          ),
                        ],
                      );
                    },
                  );
                },
                color: Colors.green,
              ),
              SwipeAction(
                content: Icon(Icons.archive),
                onTap: (context) {
                  // Action d'archivage
                },
                color: Colors.red,
              ),
            ],
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/ff3.png"),
              ),
              title: Text(
                conversation.freelance.nomComplet,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                conversation.lastMessage?.body ?? '',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                formatDate(conversation.created_at),
              ),
              onTap: () {
                //Get.to(const ChatBody());
              },
            ),
          );
          // Créez et retournez un élément de conversation ici
          // Remplacez ceci par votre élément de conversation
        },
        childCount: controller.conversation
            .length, // Remplacez ceci par le nombre d'éléments dans votre liste
      ),
    );
  }
}
