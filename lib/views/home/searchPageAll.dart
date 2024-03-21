import 'package:flutter/material.dart';

class SearchPageAll extends StatefulWidget {
  const SearchPageAll({super.key});

  @override
  State<SearchPageAll> createState() => _SearchPageAllState();
}

class _SearchPageAllState extends State<SearchPageAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Container(),
    );
  }
}
