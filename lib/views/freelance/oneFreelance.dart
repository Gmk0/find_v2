import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:find_v2/views/service/widgets/ListeServiceUser.dart';
import 'package:find_v2/views/service/widgets/OnePortFolio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class Artwork {
  final String imageUrl;
  final String description;

  Artwork({
    required this.imageUrl,
    required this.description,
  });
}

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final List<Artwork> artworks = [
    Artwork(
      imageUrl: 'https://example.com/image1.jpg',
      description: 'Description de l\'œuvre 1',
    ),
    Artwork(
      imageUrl: 'https://example.com/image2.jpg',
      description: 'Description de l\'œuvre 2',
    ),
    Artwork(
      imageUrl: 'https://example.com/image3.jpg',
      description: 'Description de l\'œuvre 3',
    ),
    // Ajoutez autant d'œuvres que vous le souhaitez
  ];
  ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showTitle = _scrollController.offset >
            0; // Mettre à true si l'utilisateur a fait défiler vers le bas
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Nombre total d'onglets
      child: Scaffold(
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              title: _showTitle ? Text('User') : null,
              floating: true,
              pinned: true,
              snap: true,
              actions: [
                IconButton(
                  color: skinFill,
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton "Aimer"
                  },
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Action à effectuer lors du clic sur le bouton "Partager"
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                //centerTitle: true,

                background: Image.network(
                  images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      //  color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoRow('Nom', 'John Doe', Icons.person),
                        _buildInfoRow(
                            'Catégorie', 'Développeur', Icons.category),
                        // _buildInfoRow('Étoiles', '4.5', Icons.star),
                        _buildInfoRow('Taux', '\$1000', Icons.attach_money),
                        _buildInfoRow(
                            'Localisation', 'New York, USA', Icons.location_on),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton Contacter
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Bordure rectangulaire
                            ),
                          ),
                          icon: Icon(Icons.email),
                          label: Text('Contacter'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton Aimer
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  5), // Bordure rectangulaire
                            ),
                          ),
                          icon: Icon(Icons.favorite),
                          label: Text('Aimer'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                tabBar: TabBar(
                  indicatorColor: skinFill,
                  isScrollable: true,
                  labelColor: skinFill,
                  // unselectedLabelColor: skinFill,
                  tabs: const [
                    Tab(text: 'A propos'),
                    Tab(text: 'Services'),
                    Tab(text: 'Realisations'),
                    //Tab(text: 'Realisation'),
                    // Tab(text: 'Tab 4'),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  _about(),
                  _portefolio(),
                  ListeServiceUser(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _about() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'À propos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
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
          const SizedBox(height: 5),
          const Text(
            'Éducation',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nom de l\'école / Université - Diplôme obtenu (Année)',
                  style: TextStyle(
                      fontSize: 14, color: Colors.grey.withOpacity(0.7)),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Certificats',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Nom de l\'école / Université - Diplôme obtenu (Année)',
                  style: TextStyle(
                      fontSize: 14, color: Colors.grey.withOpacity(0.7)),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Informations',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          _listeTitle('Lieu: Ville, Pays', Icons.location_on),
          _listeTitle('Temps de réponse: 24h', Icons.access_time),
          _listeTitle('Membre depuis: 01/01/2022', Icons.calendar_today),
          const SizedBox(height: 20),
          const Text(
            'Langues',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Wrap(
            spacing: 8.0,
            children: [
              Chip(label: Text('Français')),
              Chip(label: Text('Anglais')),
              Chip(label: Text('Espagnol')),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Compétences',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 8.0,
            children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.all(5),
                child: Chip(label: Text('Compétence ${index + 1}')),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _listeTitle(String value, IconData icon) {
    return ListTile(
      leading: Icon(icon, size: 15),
      title: Text(value,
          style: TextStyle(
            fontSize: 14,
          )),
    );
  }

  Widget _listeService() {
    return Container();
  }

  Widget _portefolio() {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.all(10),
            // color: Colors.white,
            child: Text(
              'Oeuvres du Freelance',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: artworks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(OnePortefolio(), transition: Transition.fadeIn);
                    // Action à effectuer lors du clic sur une œuvre
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 4.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            images[0],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            artworks[index].description,
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 14),
          SizedBox(width: 10.0),
          Text(
            title + ': ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}
