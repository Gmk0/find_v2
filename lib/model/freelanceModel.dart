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

  FreelanceModel(this.id, this.nom, this.prenom, this.nomComplet,
      this.identifiant, this.description, this.level,
      {required this.user});

  factory FreelanceModel.fromJson(Map<String, dynamic> json) {
    return FreelanceModel(
        json['id'],
        json['nom'],
        json['prenom'],
        json['nomComplet'],
        json['identifiant'],
        json['description'],
        json['level'],
        user: UserModel.fromJson(json['user']));
  }
}
