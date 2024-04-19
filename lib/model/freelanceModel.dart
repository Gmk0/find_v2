import 'package:find_v2/model/categoryMode.dart';
import 'package:find_v2/model/serviceModel.dart';
import 'package:find_v2/model/userModel.dart';

class FreelanceModel {
  late String id;
  late String nom;
  late String prenom;
  late String nomComplet;
  late String identifiant;
  late String description;
  late String categoryName;
  late int level;
  late UserModel user;
  late List<Langue>? langues;
  late List<Diplome>? diplomes;
  late List<Certificat>? certificats;
  late String? site;
  late List<Competence>? competences;
  late String tauxJournalier;
  late List<Compte>? comptes;
  late List<SubCategoryModel>? subcategories;
  late Localisation? localisation;
  late double solde;
  late int commandeEncours;
  late int commandeRealiser;
  late List<ServiceModel>? services;

  FreelanceModel({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.nomComplet,
    required this.identifiant,
    required this.description,
    required this.level,
    required this.categoryName,
    required this.user,
    this.services,
    this.langues,
    this.subcategories,
    this.diplomes,
    this.certificats,
    this.site,
    this.competences,
    required this.tauxJournalier,
    this.comptes,
    this.localisation,
    required this.solde,
    required this.commandeEncours,
    required this.commandeRealiser,
  });

  factory FreelanceModel.fromJson(Map<String, dynamic> json) {
    return FreelanceModel(
        id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        categoryName: json['categorName'],
        nomComplet: json['nomComplet'],
        identifiant: json['identifiant'],
        description: json['description'],
        level: json['level'],
        //services: ,
        user: UserModel.fromJson(json['user']),
        langues: (json['langue'] as List<dynamic>?)
                ?.map((langue) => Langue.fromJson(langue))
                .toList() ??
            [],
        subcategories: (json['subCategories'] as List<dynamic>?)
            ?.map((subCategory) => SubCategoryModel.fromJson(subCategory))
            .toList(),
        diplomes:
            List<Diplome>.from(json['diplome'].map((x) => Diplome.fromJson(x))),
        certificats: List<Certificat>.from(
            json['certificat'].map((x) => Certificat.fromJson(x))),
        //site: json['site'],
        competences: List<Competence>.from(
            json['competences'].map((x) => Competence.fromJson(x))),
        tauxJournalier: json['taux_journalier'],
        comptes:
            List<Compte>.from(json['comptes'].map((x) => Compte.fromJson(x))),
        // Utilisez la clé correcte ici
        localisation: Localisation.fromJson(json['localisation']),
        solde: double.parse(json['solde']),
        commandeEncours: json['commande_encours'],
        commandeRealiser: json['commande_realiser']);
  }
}

class Langue {
  late String? langue;
  late String? level;

  Langue({
    this.langue,
    this.level,
  });

  factory Langue.fromJson(Map<String, dynamic> json) {
    return Langue(
      langue: json['langue'],
      level: json['level'],
    );
  }
}

class Diplome {
  late String? diplome;
  late String? universite;
  late String? annee;

  Diplome.fromJson(Map<String, dynamic> json) {
    diplome = json['diplome'];
    universite = json['universite'];
    annee = json['annee'].toString();
  }
}

class Certificat {
  late String? certifier;
  late String? delivrer;
  late String? annee;

  Certificat.fromJson(Map<String, dynamic> json) {
    certifier = json['certifier'];
    delivrer = json['delivrer'];
    annee = json['annee'].toString();
  }
}

class Competence {
  late String? title;
  late String? level;

  Competence.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    level = json['level'];
  }
}

class Compte {
  late String? compte;
  late String? lien;

  Compte.fromJson(Map<String, dynamic> json) {
    compte = json['compte'];
    lien = json['lien'];
  }
}

class Localisation {
  late String? ville;
  late String? commune;
  late String? avenue; // Utilisez le type correct ici

  Localisation.fromJson(Map<String, dynamic> json) {
    ville = json['ville'];
    commune = json['commune'];
    avenue = json['avenue'];
  }
}
