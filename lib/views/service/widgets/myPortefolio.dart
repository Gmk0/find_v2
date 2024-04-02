import 'package:find_v2/utils/assets.dart';
import 'package:find_v2/views/service/AllPortefolio.dart';
import 'package:find_v2/views/service/widgets/OnePortFolio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyportefolioService extends StatelessWidget {
  const MyportefolioService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 300),
      //decoration: BoxDecoration(color: Colors.grey.shade100),
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
                  Get.to(() => AllPortefolio());
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
                        Get.to(OnePortefolio(), transition: Transition.fadeIn);
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
