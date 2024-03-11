import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/userModel.dart';

class ConversationModel {
  late int freelance_id;
  late int user_id;
  late String status;
  late int id;
  late bool is_blocked;
  late DateTime created_at;
  late UserModel user; // Relation avec le modèle UserModel
  late FreelanceModel freelance; // Relation avec le modèle FreelanceModel

  ConversationModel({
    required this.freelance_id,
    required this.user_id,
    required this.status,
    required this.id,
    required this.is_blocked,
    required this.user,
    required this.freelance,
    required this.created_at,
  });

  // Méthode de conversion JSON en objet ConversationModel
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      freelance_id: json['freelance_id'],
      user_id: json['user_id'],
      status: json['status'],
      id: json['id'],
      is_blocked: json['is_blocked'],
      created_at: json['created_at'],
      user: UserModel.fromJson(json['user']), // Convertir le JSON en UserModel
      freelance: FreelanceModel.fromJson(
          json['freelance']), // Convertir le JSON en FreelanceModel
    );
  }
}
