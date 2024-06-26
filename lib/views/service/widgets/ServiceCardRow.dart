import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/OneServiceView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCardRow extends StatelessWidget {
  const ServiceCardRow({super.key, required this.service});
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 8),
      child: GestureDetector(
        onTap: () => {Get.to(oneServiceView(), transition: Transition.fadeIn)},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: const Offset(2, 2),
                blurRadius: 16,
              ),
            ],
          ),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Stack(alignment: Alignment.topLeft, children: [
                  Container(
                    height: 150.0,
                    width: 140.0,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                            appLogo), // Remplacez par l'image de l'utilisateur
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ]),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    constraints:
                        const BoxConstraints(minHeight: 100, maxHeight: 150),
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 16.0,
                                ),
                                TextComponent(
                                  text: "(4)",
                                  size: 16,
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            child: Text(
                              service.title,
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                                onTap: () {
                                  Get.to(oneServiceView(),
                                      transition: Transition.fadeIn);
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text('a partir de '),
                                    const SizedBox(width: 5),
                                    Text(
                                      service.basicPrice,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: skinFill,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
              // Ajouter d'autres détails du service si nécessaire
            ),
          ),
        ),
      ),
    );
  }
}
