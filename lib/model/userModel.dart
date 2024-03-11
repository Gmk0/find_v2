class UserModel {
  late String id;
  late String name;
  late String email;
  late String slug;
  late String emailVerifiedAt;
  late String phone;
  late String referenceCode;
  late String profilePhotoPath;
  late String lastActivity;

  UserModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.slug,
      this.referenceCode,
      this.emailVerifiedAt,
      this.profilePhotoPath,
      this.lastActivity);

  // Méthode pour créer une instance de UserModel à partir des données JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      json['id'].toString(),
      json['name'].toString(),
      json['email'].toString(),
      json['phone'].toString(),
      json['slug'].toString(),
      json['referenceCode'].toString(),
      json['emailVerifiedAt'].toString(),
      json['profilePhotoPath'].toString(),
      json['lastActivity'].toString(),
    );
  }

  // Méthode pour convertir le modèle en un objet JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'slug': slug,
      'referenceCode': referenceCode,
      'emailVerifiedAt': emailVerifiedAt,
      'profilePhotoPath': profilePhotoPath,
      'lastActivity': lastActivity
    };
  }
}
