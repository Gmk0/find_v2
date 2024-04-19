import 'dart:convert';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/controller/pusherController.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:find_v2/model/messageModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:find_v2/utils/service_pusher.dart';

//import 'package:find_v2/utils/laravelEcho.text';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  var conversations = <ConversationModel>[].obs;

  late String currentUserReceiver; // Le récepteur actuel de l'utilisateur

  final PusherController pusherController = Get.find();
  final PusherService _pusherService = PusherService();
  var user = Get.find<AuthController>().user.value;

  @override
  Future<void> onInit() async {
    fetchConversation();

    // _pusherService.initPusher();
    // _pusherService.chatChannel(user.id);
    // ever(pusherController.event, handleEvent);

    super.onInit();
  }

  void handleEvent(PusherEvent? event) {
    // Votre logique pour traiter l'événement

    Map<String, dynamic> data = jsonDecode(event?.data);
    if (data.containsKey('message')) {
      onMessageReceived(data);
      //  Map<String, dynamic> message = data['message'];
      //   String body = message['body'];
      // print('Message : $body');
    } else {
      print('Pas de message dans cet événement');
    }

    // print('dans chat ${message}');
  }

  @override
  void dispose() {
    _pusherService.unsubscribe(user.id);
    super.dispose();
  }

  Future<void> fetchConversation() async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.conversationEndPoints.allConversation);
      http.Response response =
          await http.get(url, headers: await ApiEndPoints.getHeaders());

      if (response.statusCode == 200) {
        final responseData =
            jsonDecode(response.body)['conversations_user'] as List<dynamic>;

        conversations.value = responseData
            .map((data) => ConversationModel.fromJson(data))
            .toList();

        conversations
            .sort((a, b) => b.last_time_message.compareTo(a.last_time_message));
        // print(conversations.value);
      } else {
        print(response.statusCode);
        //print('Erreur lors de la récupération des données');
      }
    } catch (e) {
      print('erreurs  chat' + e.toString());
    }
  }

  Future<MessageModel> sendMessage(MessageModel message) async {
    try {
      var url = Uri.parse(ApiEndPoints.baseUrl +
          ApiEndPoints.conversationEndPoints.sendMessage);
      http.Response response = await http.post(
        url,
        body: jsonEncode(<String, dynamic>{
          'message': message.body,
          'receiver_id': message.receiverId,
          'chatId': message.conversationId,
        }),
        headers: await ApiEndPoints.getHeaders(),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        Map<String, dynamic> responseData = json['message'];
        Map<String, dynamic> conversationData = json['conversation'];
        MessageModel sentMessage = MessageModel.fromJson(responseData);
        ConversationModel conversation =
            ConversationModel.fromJson(conversationData);

        updateConversationList(conversation);

        return sentMessage;
      } else {
        Get.snackbar("Erreur", "erreur survenue lors de l'envoie du message",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 6));
        return message;
      }
    } catch (error) {
      // Gérez les erreurs ici
      print('les erreurs' + error.toString());
      String errorMessage = error.toString();
      Get.snackbar('Erreur', errorMessage,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 6));
      return message;
    }
  }

  void updateLastMessage(
      ConversationModel conversationGet, MessageModel newMessage) {
    // Trouver l'index de la conversation dans la liste
    int index =
        conversations.indexWhere((conv) => conv.id == conversationGet.id);
    if (index != -1) {
      // Mettre à jour le dernier message de la conversation
      conversations[index].lastMessage = newMessage;
    }
  }

  void updateConversationList(ConversationModel updatedConversation) {
    // Récupérer l'index de la conversation existante dans la liste
    int conversationIndex =
        conversations.indexWhere((conv) => conv.id == updatedConversation.id);

    if (conversationIndex != -1) {
      // Remplacer la conversation existante par la nouvelle conversation
      conversations[conversationIndex] = updatedConversation;
    } else {
      // Ajouter la nouvelle conversation à la liste si elle n'existe pas déjà
      conversations.add(updatedConversation);
    }
  }

  Future<String> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  void onMessageReceived(Map<String, dynamic> data) {
    try {
      var message = MessageModel.fromJson(data['message']);
      var conversation = conversations.firstWhereOrNull(
        (c) => c.id == message.conversationId,
      );
      // Si la conversation existe
      if (conversation != null) {
        // Ajouter le nouveau message à la liste des messages de la conversation
        conversation.allMessages?.add(message);
        conversation.lastMessage = message;
        conversation.last_time_message = message.created_at;
        // Mettre à jour la liste des conversations
        conversations.refresh();
      } else {
        // Gérer le cas où la conversation n'existe pas
        print('Conversation not found');
      }
    } catch (e) {
      print('erreur de load message ${e.toString()}');
    }
  }
}
