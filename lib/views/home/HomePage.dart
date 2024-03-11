import 'package:find_v2/components/backgroundConstainer.dart';
import 'package:find_v2/components/customAppBar.dart';
import 'package:find_v2/components/header.dart';
import 'package:find_v2/components/search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BackgroundConstainer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(),
                const Column(
                  children: [
                    Header(),
                    //HomeSection(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
