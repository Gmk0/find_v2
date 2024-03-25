import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class OneService2 extends StatefulWidget {
  const OneService2({super.key});

  @override
  State<OneService2> createState() => _OneService2State();
}

class _OneService2State extends State<OneService2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
        ],
      ),
    );
  }

  Widget appBar() {
    return Stack(
      children: [
        Swiper(
          itemCount: introIllus.length,
          itemBuilder: (BuildContext context, int index) {
            final service = introIllus[index];
            return Hero(
              tag: "lamen",
              child: PNetworkImage(
                introIllus[index],
                fit: BoxFit
                    .cover, // Ajustez le mode d'ajustement en fonction de vos besoins
              ),
            );
          },
          pagination:
              SwiperPagination(), // Optionnel : Ajoute des indicateurs de pagination
          control:
              SwiperControl(), // Optionnel : Ajoute des boutons de contrôle (précédent/suivant)
        ),
        Positioned(
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 25,
                right: 25,
              ),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 360 - 30,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 30,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 5,
              color: skinFill,
            ),
          ),
        )
      ],
    );
  }
}
