import 'dart:convert';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/conversationModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var conversation = <ConversationModel>[].obs;

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
        conversation.value = responseData
            .map((data) => ConversationModel.fromJson(data))
            .toList();
      } else {
        print('Erreur lors de la récupération des données');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
