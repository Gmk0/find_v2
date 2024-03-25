import 'package:find_v2/model/userModel.dart';

class FreelanceModel {
  late String id;
  late String nom;
  late String prenom;
  late String nomComplet;
  late String identifiant;
  late String description;
  late int level;
  late UserModel user;

  FreelanceModel(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.nomComplet,
      required this.identifiant,
      required this.description,
      required this.level,
      required this.user});

  factory FreelanceModel.fromJson(Map<String, dynamic> json) {
    return FreelanceModel(
        id: json['id'],
        nom: json['nom'],
        prenom: json['prenom'],
        nomComplet: json['nomComplet'],
        identifiant: json['identifiant'],
        description: json['description'],
        level: json['level'],
        user: UserModel.fromJson(json['user']));
  }
}
