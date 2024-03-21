import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/OneService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(this.service, {super.key});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.topRight, children: [
          Container(
            height: 140.0,
            //width: 190.0,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/ff3.png'), // Remplacez par l'image de l'utilisateur
                fit: BoxFit.cover,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline,
              color: Colors.grey.shade300,
            ),
          ),
        ]),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: AssetImage(
                              'assets/images/ff3.png'), // Remplacez par l'image de l'utilisateur
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'bro', // Ajoutez le nom de l'utilisateur ici
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.grey),
                            ),
                            Text(
                              'level 4', // Ajoutez le nom de l'utilisateur ici
                              style:
                                  TextStyle(fontSize: 11.0, color: Colors.grey),
                            ),
                          ],
                        )
                      ],
                    ),
                    const Text("4"),
                  ],
                ),
                const SizedBox(width: 10),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(OneService(service: service));
                      },
                      child: Text(
                        service.title,
                        style: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    )),
                const SizedBox(width: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(OneService(service: service));
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
    );
  }
}
