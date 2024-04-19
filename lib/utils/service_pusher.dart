import 'dart:async';
import 'dart:convert';

import 'package:find_v2/controller/pusherController.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:find_v2/utils/apiEndPoints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PusherService {
  PusherChannelsFlutter _pusher = PusherChannelsFlutter.getInstance();

  static final PusherService _singleton = PusherService._internal();

  factory PusherService() {
    return _singleton;
  }

  PusherService._internal();

  Future<void> initPusher() async {
    try {
      _pusher.init(
        apiKey: 'edc1363d659a43d246a2',
        cluster: 'us3',
        useTLS: true,
        onConnectionStateChange: onConnectionStateChange,
        authEndpoint: ApiEndPoints.authPusher,
        authParams: {
          'headers': await ApiEndPoints.getHeaders(),
        },
      );

      String userId = await getUserId();

      print(userId);
      await _pusher.connect();
      chatChannel(userId);
    } catch (e) {
      print(e);
    }
  }

  Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userData');
    final userMap = jsonDecode(userData!);
    final id = userMap['id'];
    return id;
  }

  void chatChannel(String userid) async {
    try {
      await _pusher.subscribe(
        channelName: "chat.${userid}",
        onEvent: (event) {
          print(event);
          Get.find<PusherController>().event.value = event;
          //eventController.add(event);
        },
      );
    } catch (e) {
      print('error de pusher ${e.toString()}');
    }
  }

  void disconet() {
    _pusher.disconnect();
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    print("Connection: $currentState");
  }

  void unsubscribe(userId) async {
    if (_pusher.connectionState == 'CONNECTING') {
      try {
        await _pusher.unsubscribe(channelName: 'chat.${userId}}');
        await _pusher.unsubscribe(channelName: 'public');
        _pusher.disconnect();
      } catch (e) {}
    }
  }
}
