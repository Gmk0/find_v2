import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Annonce {
  final String texte;
  final IconData icon;

  Annonce(this.texte, this.icon);
}

class AnnonceHome extends StatelessWidget {
  AnnonceHome({Key? key}) : super(key: key);

  List<Annonce> annonces = [
    Annonce("Transformez vos passions en profits.", FontAwesomeIcons.moneyBill),
    Annonce("Vos compétences, votre succès.", FontAwesomeIcons.trophy),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Card(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: skinFill, // Remplacez par votre couleur skinFill
            ),
            child: Swiper(
              itemCount: annonces.length,
              loop: true,
              autoplay: true,
              itemBuilder: (context, index) {
                return Row(
                  children: <Widget>[
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            annonces[index].texte,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    CircleAvatar(
                      backgroundColor: Colors.grey.shade100,
                      radius: 50,
                      child: Icon(
                        annonces[index].icon,
                        color: skinFill, // Remplacez par votre couleur skinFill
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
