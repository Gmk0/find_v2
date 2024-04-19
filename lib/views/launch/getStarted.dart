import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/components/swiper_pagination.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/auth/authView.dart';
import 'package:find_v2/views/auth/login.dart';
import 'package:find_v2/views/auth/started_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  final SwiperController _swiperController = SwiperController();

  final List<String> _titles = [
    "Trouvez des professionnels qualifiés.",
    "Connectez-vous avec des freelances compétents.",
    "Découvrez une nouvelle façon de trouver des talents.",
  ];

  final int _pageCount = 3;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: const PNetworkImage(
              "https://www.find-freelance.com/images/logo/find_02.png",
              fit: BoxFit.contain,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Swiper(
                  index: _currentIndex,
                  controller: _swiperController,
                  itemCount: _pageCount,
                  onIndexChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  loop: false,
                  itemBuilder: (context, index) {
                    return _buildPage(
                        title: _titles[index], icon: imagesSplash[index]);
                  },
                  pagination: SwiperPagination(
                      builder: CustomPaginationBuilder(
                          activeSize: const Size(10.0, 20.0),
                          size: const Size(10.0, 15.0),
                          color: Colors.grey.shade600)),
                ),
              ),
              const SizedBox(height: 10.0),
              _buildButtons()
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      margin: const EdgeInsets.only(right: 16.0, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey.shade700,
            ),
            child: const Text("Skip"),
            onPressed: () {
              Get.to(
                const GetStartedView(),
                transition: Transition.fadeIn,
              );
              //Navigator.of(context).pushReplacementNamed('');
            },
          ),
          IconButton(
            icon: Icon(
              _currentIndex < _pageCount - 1
                  ? FontAwesomeIcons.circleArrowRight
                  : FontAwesomeIcons.circleCheck,
              size: 40,
            ),
            onPressed: () async {
              if (_currentIndex < _pageCount - 1) {
                _swiperController.next();
              } else {
                Get.to(
                  const GetStartedView(),
                  transition: Transition.fadeIn,
                );
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildPage({required String title, required String icon}) {
    const TextStyle titleStyle =
        TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          image: DecorationImage(
              image: AssetImage(icon),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.black38, BlendMode.multiply)),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10.0,
                spreadRadius: 5.0,
                offset: Offset(5.0, 5.0),
                color: Colors.black26)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: titleStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
