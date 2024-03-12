import 'dart:ffi';

import 'package:find_v2/controller/chatController.dart';
import 'package:find_v2/views/ChatUser/widget/ChatList.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 60.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    'conversations',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade800,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8), // Espacement entre le titre et le bouton
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Action à exécuter lors du clic sur le bouton
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100),
                  ),
                ),
              ),
            ),
          ),
          ChatListComponent(),
        ],
      ),
    );
  }
}
