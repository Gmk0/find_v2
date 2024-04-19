import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:find_v2/views/ChatUser/widget/bodyChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController = Get.find<ChatController>();
    chatController.fetchConversation();
  }

  String formatDate(DateTime dateNotFormater) {
    //DateTime dateNotFormater = DateTime.parse(apiDate);

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

  Widget build(BuildContext context) {
    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
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
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      chatController
                          .conversations[index].freelance.user.profilePhotoPath,
                    ),
                  ),
                  title: Text(
                    chatController.conversations[index].freelance.nomComplet,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chatController.conversations[index].lastMessage?.body ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatDate(chatController
                            .conversations[index].last_time_message),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        width: 18,
                        height: 18,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${chatController.conversations[index].unreadCount}',
                          style: const TextStyle(
                              fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Get.to(
                      () => BodyChat(
                        chatController.conversations[index].allMessages,
                        receiver:
                            chatController.conversations[index].freelanceUser,
                        conversation: chatController.conversations[index],
                      ),
                      transition: Transition.rightToLeftWithFade,
                    );
                  },
                ),
              );
              // Créez et retournez un élément de conversation ici
              // Remplacez ceci par votre élément de conversation
            },
            childCount: chatController.conversations.length,
          ),
        ));
  }
}
