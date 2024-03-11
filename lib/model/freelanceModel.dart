class FreelanceModel {
  late String id;
  late String nom;
  late String prenom;
  late String nomComplet;
  late String identifiant;
  late String description;
  late int level;

  FreelanceModel(
    this.id,
    this.nom,
    this.prenom,
    this.nomComplet,
    this.identifiant,
    this.description,
    this.level,
  );

  factory FreelanceModel.fromJson(Map<String, dynamic> json) {
    return FreelanceModel(
      json['id'],
      json['nom'],
      json['prenom'],
      json['nomComplet'],
      json['identifiant'],
      json['description'],
      json['level'],
    );
  }
}
