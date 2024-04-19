import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/components/bottomNav.dart';
import 'package:find_v2/views/order/one_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListeOrder extends StatefulWidget {
  const ListeOrder({Key? key}) : super(key: key);

  @override
  _ListeOrderState createState() => _ListeOrderState();
}

class _ListeOrderState extends State<ListeOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commandes'),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.filter_1_rounded))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 20, // Remplacez par le nombre réel de commandes
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(
                    'Commande \$${index + 1}'), // Remplacez par le titre réel de la commande
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(text: 'Détails de la commande', size: 13),
                    SizedBox(
                        height:
                            10), // Remplacez par les détails réels de la commande
                    Row(
                      children: [
                        Text('Statut: '),
                        SizedBox(width: 5),
                        Text(
                          'En cours traitement', // Remplacez par le statut réel de la commande
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: statusColor("En attente"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Get.to(OneOrder(),
                      transition: Transition.rightToLeftWithFade);
                  // Naviguer vers la page de détails de la commande
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }

  Color statusColor(String status) {
    switch (status) {
      case 'failed':
        return Colors.red;
      case 'en attente':
        return Colors.yellow;

      default:
        return Colors.green;
    }
  }
}
