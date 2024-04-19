import 'dart:ui';

import 'package:find_v2/components/TextComponent.dart';
import 'package:find_v2/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OneOrder extends StatefulWidget {
  const OneOrder({super.key});

  @override
  State<OneOrder> createState() => _OneOrderState();
}

class _OneOrderState extends State<OneOrder> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Détails de la commande'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Wrap(children: [
                  TextComponent(
                    text: 'Commande :',
                    size: 16.sp,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const TextComponent(
                    text: '2049493394940393',
                    size: 17,
                    fw: FontWeight.bold,
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextComponent(
                        text: 'Serivce :',
                        size: 16.sp,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: const Text(
                              'je suis content de tester ca cette une bonne chose pour moi'),
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Wrap(children: [
                  TextComponent(
                    text: 'Date commande :',
                    size: 16.sp,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextComponent(
                    text: '2024-01-22',
                    size: 15.sp,
                    fw: FontWeight.w500,
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Wrap(children: [
                  TextComponent(
                    text: 'Paiement :',
                    size: 16.sp,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Reussie',
                        style: TextStyle(fontSize: 12.sp),
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(children: [
                  const TextComponent(
                    text: 'Paiement au freelance :',
                    size: 16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: statusColor("failed"),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Reussie',
                        style: TextStyle(fontSize: 12.sp),
                      ))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Wrap(children: [
                  const TextComponent(
                    text: 'Etat de la commande :',
                    size: 16,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          color: statusColorTraitement("Livré"),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        'Reussie',
                        style: TextStyle(fontSize: 12.sp),
                      ))
                ]),
              ),
              const SizedBox(height: 10),
              const Divider(height: 10),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: const Column(
                  children: [
                    LinearProgressIndicator(
                        value: 0.5,
                        minHeight: 10,
                        color: Colors.green,
                        semanticsLabel: '20',
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    SizedBox(height: 10),
                    TextComponent(text: "20 %", size: 15)
                  ],
                ),
              ),
              const Divider(height: 10),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const TextComponent(text: "Freelance lier", size: 15),
                    SizedBox(height: 15),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(images[0]),
                          radius: 50.0,
                        ),
                        SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {},
                          child: const TextComponent(
                            text: 'georges',
                            size: 14,
                          ),
                        ) // Espacement entre la photo et le nom
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Divider(height: 10),
              Container(
                margin: EdgeInsets.all(10),
                child: Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    OutlinedButton.icon(
                      onPressed: () {
                        // Action à effectuer lors du clic sur le bouton Contacter
                      },
                      style: OutlinedButton.styleFrom(
                        // Couleur du texte et de l'icône
                        minimumSize: const Size(120, 60),
                        side: const BorderSide(
                            color: Colors.blue,
                            width: 2), // Couleur et épaisseur du contour
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Bordure rectangulaire
                        ),
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Contacter',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Action à effectuer lors du clic sur le bouton Contacter
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(120, 60),
                        // Couleur du texte et de l'icône
                        side: BorderSide(
                            color: Colors.blue,
                            width: 2), // Couleur et épaisseur du contour
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Bordure rectangulaire
                        ),
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Evaluer',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        // Action à effectuer lors du clic sur le bouton Contacter
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(120, 60),
                        // Couleur du texte et de l'icône
                        side: BorderSide(
                            color: Colors.blue,
                            width: 2), // Couleur et épaisseur du contour
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(5), // Bordure rectangulaire
                        ),
                      ),
                      icon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),
                      label: Text(
                        'Repayer',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 10),
              Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const TextComponent(text: "Transaction lies", size: 15),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Wrap(children: [
                        TextComponent(
                          text: 'Transaction:',
                          size: 14.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextComponent(
                          text: '23485930849002',
                          size: 15.sp,
                          fw: FontWeight.w500,
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Wrap(children: [
                        TextComponent(
                          text: 'Date:',
                          size: 14.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextComponent(
                          text: '23485930849002',
                          size: 15.sp,
                          fw: FontWeight.w500,
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Wrap(children: [
                        TextComponent(
                          text: 'Montant:',
                          size: 14.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextComponent(
                          text: '200 \$',
                          size: 15.sp,
                          fw: FontWeight.bold,
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: Wrap(children: [
                        TextComponent(
                          text: 'Statut :',
                          size: 14.sp,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextComponent(
                          text: '',
                          size: 15.sp,
                          fw: FontWeight.bold,
                        )
                      ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
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

  Color statusColorTraitement(String status) {
    switch (status) {
      case 'En cours de traitement':
        return Colors.red;
      case 'En transit':
        return Colors.blue;
      case 'Livré':
        return Colors.green;
      case 'En attente':
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }
}
