import 'package:find_v2/controller/UserController.dart';
import 'package:find_v2/controller/chatController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/pusherController.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Container());
  }
}
