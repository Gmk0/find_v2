import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/components/buildServiceCard.dart';
import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widgets/_SliverAppBarDelegate.dart';

class OneCategory extends StatelessWidget {
  final CategoryModel category;

  const OneCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Accédez au contrôleur de catégorie
    final ServiceController serviceController = Get.find();
    String link =
        "https://cdn.pixabay.com/photo/2017/12/10/17/40/prague-3010407_960_720.jpg";

    // Récupérez les services de la catégorie actuelle
    // final services = serviceController.getServicesByCategory(category);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomSheet: BottomNav(),
      body: Obx(() {
        final services = serviceController.getServicesByCategory(category);

        return CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 100.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  children: [
                    Text(
                      category.name,
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
                          // Action du premier bouton
                        },
                        child: Text('all'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Action du deuxième bouton
                        },
                        child: Text('Bouton 2'),
                      ),
                    ],
                  ),
                ),
              ),
              floating: true,
              pinned: false,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  height: 100.h,
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (((context, index) => Container())),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      itemCount: 5),
                ),
              ),
            ),
            if (services.isEmpty)
              SliverToBoxAdapter(
                child: Center(
                  child: Text("Aucun service disponible"),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final service = services[index];
                    return BuildServiceCard(service: service);
                  },
                  childCount: services.length,
                ),
              ),
          ],
        );
      }),
    );
  }

  Widget buildBottomSheet() {
    // Implémentez ici votre contenu pour le bottom sheet de filtrage
    return Container(
      child: Text('Bottom sheet de filtrage'),
    );
  }

  Widget Filtre(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Gérer la recherche en temps réel ici
                },
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              // Afficher le bottom sheet des options de filtrage
              showModalBottomSheet(
                context: context,
                builder: (context) => buildBottomSheet(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget Filtre2(context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher...',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Gérer la recherche en temps réel ici
                },
              ),
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              // Afficher le bottom sheet des options de filtrage
              showModalBottomSheet(
                context: context,
                builder: (context) => buildBottomSheet(),
              );
            },
            child: Text('Filtrer'),
          ),
        ],
      ),
    );
  }

  Widget buildServiceList(List<ServiceModel> services) {
    return Obx(
      () {
        if (services.isEmpty) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'Aucun service disponible pour le moment.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          );
        } else {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final service = services[index];
                // Retourner ici le widget représentant un service
                return ListTile(
                  title: Text(service.title),
                  // Ajouter d'autres détails du service si nécessaire
                );
              },
              childCount: services.length,
            ),
          );
        }
      },
    );
  }
}
