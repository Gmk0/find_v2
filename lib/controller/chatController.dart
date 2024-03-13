import 'dart:convert';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:find_v2/model/messageModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var conversations = <ConversationModel>[].obs;

  @override
  void onInit() {
    fetchConversation();
    super.onInit();
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
        print(responseData);
        conversations.value = responseData
            .map((data) => ConversationModel.fromJson(data))
            .toList();

        conversations
            .sort((a, b) => b.last_time_message.compareTo(a.last_time_message));
      } else {
        print('Erreur lors de la récupération des données');
      }
    } catch (e) {
      print('les erreurs' + e.toString());
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
}
