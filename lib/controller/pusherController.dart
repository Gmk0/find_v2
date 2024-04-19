import 'dart:convert';
import 'dart:ui';

import 'package:find_v2/controller/UserController.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/model/messageModel.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class PusherController extends GetxController {
  //var event = <PusherEvent>[].obs;

  final event = Rx<PusherEvent?>(null);
  var connectivityStatus = Rx<ConnectivityResult?>(null);

  @override
  void onInit() {
    super.onInit();
    // Initialisez l'état de la connectivité
    connectivityStatus.value = ConnectivityResult.none;
    // Écoutez les changements de connectivité
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Mettez à jour l'état de la connectivité
      connectivityStatus.value = result;
      // Si l'utilisateur est en ligne, exécutez une action
      if (result != ConnectivityResult.none) {
        // Remplacez cette ligne par l'action que vous voulez exécuter
        print('Vous vous êtes reconnecté!');
      }
    });
  }
}
