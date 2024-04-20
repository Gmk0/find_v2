import 'package:find_v2/common/loading_overlay.dart';
import 'package:find_v2/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompteSetting extends StatefulWidget {
  const CompteSetting({super.key});

  @override
  State<CompteSetting> createState() => _CompteSettingState();
}

class _CompteSettingState extends State<CompteSetting> {
  var controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mon Compte'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  title: Text('Informations de l\'utilisateur'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Nom: ${controller.user.value.name}'),
                      Text('Email: ${controller.user.value.email}'),
                      // Ajoutez plus d'informations ici
                    ],
                  ),
                ),
              ),

              // Deuxième section : Gestion du compte
              Card(
                child: ListTile(
                  title: Text('Gestion du compte'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Changer le mot de passe'),
                      Text('Paramètres de confidentialité'),
                      // Ajoutez plus d'options ici
                    ],
                  ),
                ),
              ),

              // Bouton de déconnexion
              Card(
                child: ListTile(
                  title: Text('Déconnexion'),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () async {
                    LoadingScreen.instance()
                        .show(context: context, text: "Decoonnexion...");
                    //await Future.delayed(const Duration(seconds: 1));

                    // ignore: await_only_futures
                    await controller.logout();
                    LoadingScreen.instance().hide();
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
