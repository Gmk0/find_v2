import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/TextName.dart';
import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/OneService.dart';
import 'package:find_v2/views/service/OneServiceView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard(this.service, {super.key});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    String link = '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(alignment: Alignment.topRight, children: [
          Container(
              constraints: BoxConstraints(
                maxHeight: 140.h,
                minHeight: 130.h,
                maxWidth: 220.w,
                minWidth: 220.w,
              ),
              height: 130.h,
              width: 220.w,
              decoration: BoxDecoration(
                color: ThemeDarkBackground.getBackgroundColor(context),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: PNetworkImage(
                service.media != null && service.media!.isNotEmpty
                    ? service.media![0].url
                    : images[0],
                fit: BoxFit.cover,
              )),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundImage: NetworkImage(
                              service.freelance.user.profilePhotoPath),
                          // Remplacez par l'image de l'utilisateur
                        ),
                        SizedBox(width: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextName(
                              name: service.freelance.user.name,
                              size: 12.sp,
                              taille: 14, // Ajoutez le nom de l'utilisateur ici
                            ),
                            Text(
                              'Niveau ${service.freelance.level}', // Ajoutez le nom de l'utilisateur ici
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.grey),
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
                        Get.to(oneServiceView());
                      },
                      child: Text(
                        service.title,
                        style: TextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    )),
                const SizedBox(width: 20),
                Expanded(
                  child: Row(
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
                              TextComponent(text: 'a partir de', size: 13),
                              const SizedBox(width: 5),
                              Text(
                                '${service.basicPrice} \$',
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    color: skinFill,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 2),
                            ],
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
