import 'package:find_v2/components/CustomButton.dart';
import 'package:find_v2/components/reusableText.dart';
import 'package:find_v2/controller/ServiceController.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/widgets/comment.dart';
import 'package:find_v2/views/service/widgets/headerService.dart';
import 'package:find_v2/views/service/widgets/headerService2.dart';
import 'package:find_v2/views/service/widgets/myPortefolio.dart';
import 'package:find_v2/views/service/widgets/rowUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:bottom_sheet/bottom_sheet.dart';

class oneServiceView extends StatefulWidget {
  const oneServiceView({Key? key}) : super(key: key);

  @override
  State<oneServiceView> createState() => _oneServiceViewState();
}

class _oneServiceViewState extends State<oneServiceView> {
  ScrollController _controller = ScrollController();
  final ServiceController serviceController = Get.find();
  bool _showAppBar = false;
  String _selectedPackage = 'Basique';
  bool _selected2 = true;
  double _currentPrice = 10.0; // Prix initial pour le package 1

  void _updatePrice(double price) {
    setState(() {
      _currentPrice = price;
    });
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showAppBar = _controller.offset > 100;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar:
          true, // Pour étendre l'arrière-plan derrière l'appBar
      appBar: AppBar(
        backgroundColor: _showAppBar
            ? (Theme.of(context).brightness == Brightness.dark
                ? Colors.grey.shade900
                : Colors.white)
            : Colors.transparent,
        elevation: _showAppBar ? 4.0 : 0.0, // Supprime l'ombre de l'appBar
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.share_rounded),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        children: [
          // Arrière-plan de l'image

          // Contenu de la page
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderService2(),
                SizedBox(height: 10),
                RowUser(),
                Divider(),

                // Titre
                _description(),

                MyportefolioService(),

                CommentsService(),

                otherGiges(),

                // Ajoutez d'autres éléments au besoin...
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Petit bouton pour le chat
          // Espace entre les boutons
          // Grand bouton pour la commande
          FloatingActionButton.extended(
            onPressed: () {
              // Action à effectuer lors du clic sur le bouton de paiement
            },
            label: Text('Chat'),
            icon: Icon(Icons.chat),
          ),
        ],
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

// Corps pour les informations de l'utilisateur

//

// Wd

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Titre du service',
            style: TextStyle(fontSize: 20),
          ),
        ),
        // Description du service
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ReadMoreText(
            'Description du service. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet pretium urna. Donec aliquam neque ac tortor aliquam, sed ultricies eros ultricies. Fusce tincidunt massa sit amet neque tincidunt, sed tincidunt elit ultricies. Nam eget nibh euismod, tincidunt libero a, ultrices diam. Maecenas eget lacus ut enim hendrerit ultricies. Maecenas sit amet lectus euismod, ultricies risus eget, ultricies nibh.',
            trimLines: 4,
            colorClickableText: const Color(0xFF5F67EA),
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Plus',
            trimExpandedText: ' Réduire',
            style: TextStyle(
              color: Colors.grey.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ),
        // Choisir le package du service
        // Besoins du service
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Besoins :',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text('Besoin 1'),
              Text('Besoin 2'),
              Text('Besoin 3'),
              // Ajoutez d'autres besoins ici si nécessaire
            ],
          ),
        ),

        if (_selected2) ...[
          _buildPackageSelection(),
          SizedBox(height: 20),
          _buildPackageContent(),
          SizedBox(height: 20),
        ],
        Center(
          child: CustomButton(
            btntext: 'Commander (\$ $_currentPrice)',
            onBtnPressed: () {},
          ),
        )

        // Bouton pour commander le service
      ],
    );
  }

  Widget _buildPackageButton(String packageName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _selectedPackage = packageName;
            // Mettre à jour le prix en fonction du package sélectionné
            switch (_selectedPackage) {
              case 'Basique':
                _updatePrice(10.0);
                break;
              case 'Premium':
                _updatePrice(20.0);
                break;
              case 'Extra':
                _updatePrice(30.0);
                break;
            }
          });
        },
        child: Text(packageName,
            style: TextStyle(
              color:
                  _selectedPackage == packageName ? Colors.white : Colors.black,
            )),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              _selectedPackage == packageName ? Colors.amber : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0), // Bordure rectangulaire
          ),
        ),
      ),
    );
  }

  Widget _buildPackageSelection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choisissez un package :',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPackageButton('Basique'),
              _buildPackageButton('Premium'),
              _buildPackageButton('Extra'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageContent() {
    // Afficher le contenu du package sélectionné ici
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contenu du package $_selectedPackage :',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          // Liste des éléments du package sélectionné
          //ListTile(title: Text('Item 1')),
          //           ListTile(title: Text('Item 2')),
          //           ...
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
          const Row(
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
                                              Get.to(oneServiceView(),
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
}
