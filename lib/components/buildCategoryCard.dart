import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/category/OneCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildCategoryCard extends StatelessWidget {
  BuildCategoryCard({super.key, required this.category});
  final CategoryModel category;

  @override
  String link =
      "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg";
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => OneCategory(category: category),
            transition: Transition.leftToRightWithFade);
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: PNetworkImage(
                      // controller.category[index].media.isNotEmpty? controller.category[index].media[0].url
                      link,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    width: 150,
                    height: 50,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [Colors.black, Colors.black12])),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    width: 145,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              category.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
