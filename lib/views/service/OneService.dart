import 'dart:developer';

import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/components/serviceCard.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/utils/theme2.dart';
import 'package:find_v2/views/category/TestCategory.dart';
import 'package:find_v2/views/service/widgets/headerService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OneService extends StatelessWidget {
  OneService({super.key, required this.service});
  final ServiceModel service;
  final ServiceController serviceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Nombre d'onglets
      //backgroundColor: Colors.grey.shade200,

      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader pour l'en-tête de service
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: HeaderService(
              service: service,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),

          // SliverToBoxAdapter pour afficher la description, le prix et le bouton de commande
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.title, // Titre du service
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Description:', // Libellé pour la description
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Html(
                    data: service.description ?? '', // Votre contenu HTML
                    style: {
                      "p": Style(
                        fontSize: FontSize(16.0), // Taille de la police de base
                      ),

                      // Ajoutez d'autres styles pour différentes balises HTML si nécessaire
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Besoin:', // Libellé pour les exigences
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Html(
                    data: service.description ?? '', // Exigences du service
                    style: {'p': Style(fontSize: FontSize(16.0))},
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: myPortfolio(),
          ),
          getComment2(context),
          SliverToBoxAdapter(
            child: otherGiges(),
          ),

          // SliverFillRemaining pour le contenu de l'onglet
        ],
      ),
    );
  }

  Widget realisations() {
    return SliverFillRemaining(
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverToBoxAdapter(
                child: TabBar(
                  // TabBar pour afficher les onglets
                  tabs: [
                    Tab(text: 'Commentaires'), // Onglet Commentaires
                    Tab(text: 'Réalisations'), // Onglet Réalisations
                  ],
                  labelColor:
                      Colors.black, // Couleur du texte de l'onglet sélectionné
                  unselectedLabelColor: Colors
                      .grey, // Couleur du texte des onglets non sélectionnés
                  indicatorColor:
                      Colors.blue, // Couleur de l'indicateur de sélection
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          // Contenu des onglets
          children: [
            // Contenu de l'onglet Commentaires
            Center(
              child: Text('Commentaires Content'),
            ),
            // Contenu de l'onglet Réalisations
            Center(
              child: Text('Réalisations Content'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getComment(BuildContext context) {
    // Exemple de données de commentaires
    List<Map<String, dynamic>> comments = [
      {
        "user": "John",
        "profilePicture": "assets/john.png",
        "text": "Super service !",
        "rating": 5,
        "date": DateTime.now(),
      },
      {
        "user": "Alice",
        "profilePicture": "assets/alice.png",
        "text": "Très professionnel.",
        "rating": 4,
        "date": DateTime.now(),
      },
      // Ajoutez d'autres commentaires ici
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Commentaires',
            style: TextStyle(
              color: Colors.grey,
              fontSize: MediaQuery.of(context).size.width > 360 ? 18 : 16,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Swiper(
          itemCount: comments.length,
          layout: SwiperLayout.TINDER,
          itemBuilder: (context, index) {
            Map<String, dynamic> comment = comments[index];
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(appLogo),
                        ),
                        SizedBox(width: 8),
                        Text(comment["user"]),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(comment["text"]),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text(comment["rating"].toString()),
                        SizedBox(width: 8),
                        Text(
                          DateFormat('dd/MM/yyyy').format(comment["date"]),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget getComment2(context) {
    List<Map<String, dynamic>> comments = [
      {
        "user": "John",
        "profilePicture": "assets/john.png",
        "text": "Super service !",
        "rating": 5,
        "date": DateTime.now(),
      },
      {
        "user": "Alice",
        "profilePicture": "assets/alice.png",
        "text":
            "Très professionnel de maniere que ca puisse permetre. de faire des choise",
        "rating": 4,
        "date": DateTime.now(),
      },
      {
        "user": "Alice",
        "profilePicture": "assets/alice.png",
        "text": "Très professionnel.",
        "rating": 4,
        "date": DateTime.now(),
      },
    ];
    return SliverToBoxAdapter(
        child: Container(
            decoration: BoxDecoration(color: Colors.grey.shade100),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Commentaires',
                        style: TextStyle(
                          // color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).size.width > 360 ? 18 : 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        'Voir plus',
                        style: TextStyle(
                          // color: Colors.grey,
                          fontSize:
                              MediaQuery.of(context).size.width > 360 ? 18 : 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )),
              Container(
                // height: 150,
                constraints: BoxConstraints(minHeight: 150, maxHeight: 200),
                padding: EdgeInsets.all(10),
                // Hauteur ajustée pour la liste des commentaires
                child: ListView.builder(
                  itemCount: comments.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> comment = comments[index];
                    // Construction de chaque élément de la liste de commentaires
                    return Container(
                      constraints: BoxConstraints(maxWidth: 300),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        //elevation: 2,
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(appLogo),
                                  ),
                                  SizedBox(width: 8),
                                  Text(comment["user"]),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(comment["text"]),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellow),
                                  Text(comment["rating"].toString()),
                                  SizedBox(width: 8),
                                  Text(
                                    DateFormat('dd/MM/yyyy')
                                        .format(comment["date"]),
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
            ])));
  }

  Widget myPortfolio() {
    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mon Portfolio',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Action à effectuer lors du clic sur le bouton "Voir plus"
                },
                child: Text('Voir plus'),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              height: 150, // Hauteur des photos
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  String imageUrl = images[index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        // Action à effectuer lors du clic sur une photo
                      },
                      child: Container(
                        width: 150, // Largeur des photos
                        height: 150, // Hauteur des photos
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget otherGiges() {
    return Container(
      constraints: BoxConstraints(maxHeight: 350),
      decoration: BoxDecoration(color: Colors.grey.shade100),
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Services recement vue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: 350, // Hauteur des photos
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: serviceController.serviceAll.length,
                itemBuilder: (context, index) {
                  ServiceModel service = serviceController.serviceAll[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(16.0)),
                      ),
                      child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        height: 200,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      appLogo), // Remplacez par l'image de l'utilisateur
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 16,
                                                color: Colors.yellow,
                                              ),
                                              ReusableText(
                                                text: "(4)",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ],
                                          ),
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
                                      height: 5,
                                    ),
                                    Container(
                                      //crossAxisAlignment: CrossAxisAlignment.center,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(
                                          width: 25,
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  OneService(service: service),
                                                  transition:
                                                      Transition.fadeIn);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  const Text('a partir de '),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    service.basicPrice,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: skinFill,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getFilterBarUI() {
    return Obx(() {
      final services = serviceController.serviceAll;
      return Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                color: FindTheme.buildLightTheme().colorScheme.background,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, -2),
                      blurRadius: 8.0),
                ],
              ),
            ),
          ),
          Container(
            color: FindTheme.buildLightTheme().colorScheme.background,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '${services.length} services',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'Filter',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.sort, color: skinFill),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Divider(
              height: 1,
            ),
          )
        ],
      );
    });
  }
}
