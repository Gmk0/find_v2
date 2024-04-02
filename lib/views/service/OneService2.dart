import 'package:find_v2/components/netWorkImage.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';

class OneService2 extends StatefulWidget {
  const OneService2({super.key});

  @override
  State<OneService2> createState() => _OneService2State();
}

class _OneService2State extends State<OneService2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 300, // Définissez la hauteur du Swiper ici
              child: Swiper(
                itemCount: introIllus.length,
                itemBuilder: (BuildContext context, int index) {
                  return Hero(
                    tag: "lamen",
                    child: PNetworkImage(
                      introIllus[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: buildDropdownButton(
                          ['Black', 'Blue', 'Red'], 'Black')),
                  Expanded(
                      child:
                          buildDropdownButton(['S', 'M', 'XL', 'XXL'], 'XXL')),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
              child: const Text(
                "Kapka Valour",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("5.0 stars",
                        style: TextStyle(color: Colors.grey, fontSize: 14.0))
                  ],
                )),
                Text("\$5500",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30.0,
                    )),
                SizedBox(
                  width: 20.0,
                ),
              ],
            ),
            Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: const Text("Description",
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w400))),
            Container(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin dignissim erat in accumsan tempus. Mauris congue luctus neque, in semper purus maximus iaculis. Donec et eleifend quam, a sollicitudin magna.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ),
            myPortfolio(),
            myPortfolio(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {},
                )
              ],
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Colors.deepOrange,
                    elevation: 0,
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Buy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    color: Colors.black54,
                    elevation: 0,
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: const Text(
                        "Add a bag",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }

  Widget buildDropdownButton(List<String> items, String selectedValue) {
    return DropdownButton<String>(
      isExpanded: true,
      value: selectedValue,
      onChanged: (_) {},
      items: items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _headerService() {
    return Stack(
      children: [
        Swiper(
          itemCount: introIllus.length,
          itemBuilder: (BuildContext context, int index) {
            final service = introIllus[index];
            return Hero(
              tag: "lamen",
              child: PNetworkImage(
                introIllus[index],
                fit: BoxFit
                    .cover, // Ajustez le mode d'ajustement en fonction de vos besoins
              ),
            );
          },
          pagination:
              SwiperPagination(), // Optionnel : Ajoute des indicateurs de pagination
          control:
              SwiperControl(), // Optionnel : Ajoute des boutons de contrôle (précédent/suivant)
        )
      ],
    );
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
}
