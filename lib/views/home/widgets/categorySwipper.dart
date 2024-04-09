import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/appStyle.dart';
import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/controller/categoryController.dart';
import 'package:find_v2/views/category/OneCategory.dart';
import 'package:find_v2/views/category/allCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySwipper extends StatelessWidget {
  CategorySwipper({Key? key}) : super(key: key);

  final CategoryController controller = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    String link =
        "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg";
    return Obx(
      () {
        if (controller.category.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          ); // Afficher un indicateur de chargement si la liste est vide
        } else {
          return Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextComponent(
                      text: "Catégories",
                      size: 18,
                      fw: FontWeight.bold,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const AllCategory(),
                            transition: Transition.fadeIn);
                      },
                      child: ReusableText(
                        text: "Voir Tout",
                        style: appStyle(
                          16,
                          Colors.blue, // Couleur du texte "Voir Tout"
                          FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 230,
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () => (Get.to(
                            OneCategory(category: controller.category[index]))),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Stack(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 160,
                                      height: 180,
                                      child: PNetworkImage(
                                        controller.category[index].media
                                                .isNotEmpty
                                            ? controller
                                                .category[index].media[0].url
                                            : link,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      bottom: 0,
                                      width: 160,
                                      height: 60,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.topCenter,
                                                colors: [
                                              Colors.black,
                                              Colors.black12
                                            ])),
                                      ),
                                    ),
                                    Positioned(
                                      left: 10,
                                      bottom: 10,
                                      width: 145,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                controller.category[index].name,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12,
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
                      )),
                  separatorBuilder: ((context, index) => SizedBox(width: 35)),
                  itemCount: controller.category.length,
                ),
              )
            ],
          );
        }
      },
    );
  }
}
