import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class HeaderService2 extends StatelessWidget {
  const HeaderService2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 200, maxHeight: 250),
      child: Swiper(
        itemCount: introIllus.length,
        itemBuilder: (BuildContext context, int index) {
          final service = introIllus[index];
          return Hero(
            tag: "lamen",
            child: Image.network(
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
    );
  }
}
