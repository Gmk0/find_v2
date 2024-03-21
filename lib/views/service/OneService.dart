import 'dart:developer';

import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/service/widgets/headerService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class OneService extends StatelessWidget {
  const OneService({super.key, required this.service});
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Nombre d'onglets
        child: CustomScrollView(
          slivers: [
            // SliverPersistentHeader pour l'en-tête de service
            SliverPersistentHeader(
              pinned: true,
              floating: false,
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
                          fontSize:
                              FontSize(16.0), // Taille de la police de base
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
                    SizedBox(
                      // Bouton de commande prenant toute la largeur
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Action à effectuer lors du clic sur le bouton de commande
                        },
                        child: Text('Commander ${service.basicPrice}'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SliverFillRemaining pour le contenu de l'onglet
            realisations(),
          ],
        ),
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
}
