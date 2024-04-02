import 'package:find_v2/utils/assets.dart';
import 'package:flutter/material.dart';

class OnePortefolio extends StatelessWidget {
  const OnePortefolio({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portefolio'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share_outlined))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Ajoutez ici une petite description du portefeuille.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Action à effectuer lors du clic sur une photo
                  },
                  child: Card(
                    elevation: 4.0,
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
