import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/components/buildServiceCard.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/views/category/widgets/ListService.dart';
import 'package:find_v2/views/category/widgets/buildBottomSheetFiltre.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/_SliverAppBarDelegate.dart';

class OneSubCategory extends StatelessWidget {
  OneSubCategory({super.key, this.subCategoryModel});
  final SubCategoryModel? subCategoryModel;

  @override
  Widget build(BuildContext context) {
    final ServiceController serviceController = Get.find();
    // Récupérez les services de la catégorie actuelle

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNav(),
      body: Obx(() {
        final services =
            serviceController.getServicesBySousCategorie(subCategoryModel);

        return LayoutBuilder(
          builder: (context, constraints) {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: 100.0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Row(
                      children: [
                        Text(
                          subCategoryModel?.name ?? '',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                            width: 8), // Espacement entre le titre et le bouton
                      ],
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        // Action à exécuter lors du clic sur le bouton
                      },
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  delegate: SliverAppBarCategory(
                    minHeight: 40.0,
                    maxHeight: 40.0,
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 5),
                      child: ListView(
                        padding: EdgeInsets.only(bottom: 5),
                        scrollDirection: Axis.horizontal,
                        children: [
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled:
                                    true, // Pour permettre le défilement contrôlé
                                scrollControlDisabledMaxHeightRatio:
                                    0.9, // Ratio pour limiter la hauteur maximale
                                barrierColor: Colors
                                    .white, // Couleur de l'arrière-plan du voile
                                builder: (context) => buildBottomSheet(context,
                                    buildFilterWidget()), // Votre constructeur de bottom sheet
                              );
                            },
                            child: Text('fitlre'),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  floating: true,
                  pinned: false,
                ),
                ListService(services: services)
              ],
            );
          },
        );
      }),
    );
  }

  Widget buildFilterWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ReusableText(
            text: 'Niveau de Freelance:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ContainerFitltre(
            child: DropdownButton<String>(
              isExpanded: true,
              items: ['Débutant', 'Intermédiaire', 'Expert']
                  .map((level) => DropdownMenuItem<String>(
                        value: level,
                        child: Text(level),
                      ))
                  .toList(),
              onChanged: (value) {
                // Action à effectuer lors de la sélection du niveau de freelance
              },
            ),
          ),
          const SizedBox(height: 10),
          const ReusableText(
              text: 'Service Populaire',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          ContainerFitltre(
            child: DropdownButton<String>(
              isExpanded: true,
              items: ['Oui', 'Non']
                  .map((popular) => DropdownMenuItem<String>(
                        value: popular,
                        child: Text(popular),
                      ))
                  .toList(),
              onChanged: (value) {
                // Action à effectuer lors de la sélection du service populaire
              },
            ),
          ),
          const SizedBox(height: 10),
          const ReusableText(
              text: 'Prix',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(height: 10),
          const ReusableText(
              text: 'Temps de livraison',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          Container(
              child: Row(
            children: [],
          )),
          const SizedBox(height: 10),
          const ReusableText(
              text: 'Localisation freelance',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          const ReusableText(
              text: 'Freelance en ligne',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}

class ContainerFitltre extends StatelessWidget {
  const ContainerFitltre({super.key, required this.child});

  final Widget child;
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Prend toute la largeur disponible
      constraints: BoxConstraints(maxWidth: 350),
      child: child,
    );
  }
}
