import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/OneService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildServiceCard extends StatelessWidget {
  const BuildServiceCard({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Stack(alignment: Alignment.topLeft, children: [
            Container(
              height: 120.0,
              width: 150.0,
              decoration: const BoxDecoration(
                color: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_outline,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      const Text("4"),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(OneService(service: service),
                            transition: Transition.fadeIn);
                      },
                      child: Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(OneService(service: service),
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
                              const SizedBox(width: 2),
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
    );
  }
}
