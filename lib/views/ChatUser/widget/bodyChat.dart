import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/messageModel.dart';
import 'package:find_v2/model/userModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';

class BodyChat extends StatefulWidget {
  const BodyChat(this.messages,
      {super.key, required this.receiver, required this.conversation});

  final List<MessageModel>? messages;
  final ConversationModel conversation;
  final UserModel receiver;
  @override
  State<BodyChat> createState() => _BodyChatState();
}

class _BodyChatState extends State<BodyChat> {
  var user = Get.put(AuthController()).user.value;

  late ChatController chatController;
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatController = Get.find<ChatController>();
    print(user.id);
  }

  void sendMessage() {
    String message = _messageController.text.trim();
    if (message.isNotEmpty) {
      MessageModel newMessage = MessageModel(
        body: message,
        senderId: widget.conversation.user_id,
        receiverId: widget.receiver.id,
        conversationId: widget.messages![0].conversationId,
        isRead: false,
        created_at: DateTime.now(),
      );

      // Ajouter le nouveau message localement
      setState(() {
        widget.messages!.add(newMessage);
        // widget.conversation.lastMessage = newMessage;
      });

      _messageController.clear();
      // Envoyer le message au backend
      chatController.sendMessage(newMessage).then((serverMessage) {
        // Mettre à jour le message local avec celui renvoyé par le serveur
        setState(() {
          int index = widget.messages!.indexOf(newMessage);
          if (index != -1) {
            widget.messages![index] = serverMessage;
            // chatController.updateLastMessage(widget.conversation, serverMessage);
          }
        });
      }).catchError((error) {
        // Gérer les erreurs ici
        print("Erreur lors de l'envoi du message : $error");
      });
    }
  }

  Map<DateTime, List<MessageModel>> groupMessagesByDate(
    List<MessageModel> messages,
  ) {
    Map<DateTime, List<MessageModel>> groupedMessages = {};

    for (var message in messages) {
      // Vérifier si le message est nullj
      if (message == null || message.created_at == null) {
        continue; // Ignorer le message null ou sans date
      }

      //DateTime date = message.created_at!;
      DateTime date = message.created_at.toLocal(); // Convertir en heure locale
      DateTime dateOnly = DateTime(
          date.year, date.month, date.day); // Extraire uniquement la date

      if (!groupedMessages.containsKey(dateOnly)) {
        // Si la date n'existe pas, créer une nouvelle liste de messages
        groupedMessages[dateOnly] = [];
      }

      groupedMessages[dateOnly]!.add(message);
    }

    return groupedMessages;
  }

  String formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String formatDateForHuman(DateTime apiDate) {
    DateTime dateNotFormater = apiDate;
    final now = DateTime.now();
    if (isSameDay(dateNotFormater, now)) {
      return 'Aujourd\'hui';
    } else if (isSameDay(dateNotFormater, now.subtract(Duration(days: 1)))) {
      return 'Hier';
    } else {
      return '${dateNotFormater.day}/${dateNotFormater.month}/${dateNotFormater.year}';
    }
  }

  String isOnline(bool isOnline) {
    if (isOnline) {
      return 'en ligne';
    } else {
      return widget.receiver.lastActivity;
    }
  }

  String datev(DateTime date) {
    return date.toString();
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage(appLogo),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.receiver.name,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        isOnline(widget.receiver.isOnline),
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView.builder(
                reverse: true,
                itemCount: groupMessagesByDate(widget.messages!).length,
                itemBuilder: (context, index) {
                  DateTime date = groupMessagesByDate(widget.messages!)
                      .keys
                      .toList()[index];
                  List<MessageModel> messagesForDate =
                      groupMessagesByDate(widget.messages!)[date]!;

                  // Widget pour afficher la date
                  Widget dateWidget = Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: Text(
                          formatDate(
                              date), // Assurez-vous d'avoir une fonction formatDate
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );

                  // Liste des widgets pour les messages de cette date
                  List<Widget> messageWidgets = messagesForDate.map((message) {
                    return BubbleSpecialThree(
                      text: message.body ?? '',
                      color: message.senderId == widget.conversation.user_id
                          ? Color(0xFF1B97F3)
                          : Color.fromARGB(255, 94, 94, 97),
                      tail: true,
                      isSender: message.senderId == widget.conversation.user_id,
                      textStyle: TextStyle(color: Colors.white, fontSize: 16),
                    );
                  }).toList();

                  List<Widget> columnChildren = [dateWidget, ...messageWidgets];

                  if (index <
                      groupMessagesByDate(widget.messages!).length - 1) {
                    columnChildren.add(Divider(
                      color: Colors.grey[300],
                      height: 0,
                    ));
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: columnChildren,
                  );
                },
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {
                    sendMessage();
                  },
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.blue,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
