class UserModel {
  late String id;
  late String name;
  late String email;
  late String slug;
  late String emailVerifiedAt;
  late String phone;
  late String referralCode;
  late String profilePhotoPath;
  late String lastActivity;
  late bool isOnline = false;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.slug,
      required this.referralCode,
      required this.emailVerifiedAt,
      required this.profilePhotoPath,
      //  required this.isOnline,
      required this.lastActivity});

  // Méthode pour créer une instance de UserModel à partir des données JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      email: json['email'].toString(),
      phone: json['phone'].toString(),
      slug: json['slug'].toString(),
      //isOnline: json['is_online'],
      referralCode: json['referral_code'].toString(),
      emailVerifiedAt: json['email_verified_at'].toString(),
      profilePhotoPath: json['profile_url'].toString(),

      lastActivity: json['last_activity'].toString(),
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
      'referralCode': referralCode,
      'emailVerifiedAt': emailVerifiedAt,
      'profilePhotoPath': profilePhotoPath,
      'lastActivity': lastActivity,
      'isOnline': isOnline
    };
  }
}
