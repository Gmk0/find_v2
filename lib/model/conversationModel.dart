import 'package:find_v2/model/freelanceModel.dart';
import 'package:find_v2/model/messageModel.dart';
import 'package:find_v2/model/userModel.dart';

class ConversationModel {
  late String freelance_id;
  late String user_id;
  late String status;
  late String id;
  late bool is_blocked;
  late DateTime last_time_message;
  // ignore: non_constant_identifier_names
  late String created_at;
  late UserModel user; // Relation avec le modèle UserModel
  late FreelanceModel freelance;
  late UserModel freelanceUser;
  late MessageModel? lastMessage;
  late List<MessageModel>? allMessages;
  late int unreadCount;

  ConversationModel(
      {required this.freelance_id,
      required this.user_id,
      required this.status,
      required this.id,
      //required this.is_blocked,
      required this.user,
      required this.freelance,
      required this.created_at,
      required this.freelanceUser,
      required this.last_time_message,
      required this.unreadCount,
      this.allMessages,
      this.lastMessage});

  // Méthode de conversion JSON en objet ConversationModel
  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
        freelance_id: json['freelance_id'],
        user_id: json['user_id'],
        unreadCount: json['messagesNonLue'],
        last_time_message: DateTime.parse(json['last_time_message']),
        status: json['status'],
        id: json['id'],
        // is_blocked: json['is_blocked'],
        created_at: json['created_at'],
        allMessages: (json['allMessages'] as List<dynamic>?)
            ?.map((message) => MessageModel.fromJson(message))
            .toList(),
        user: UserModel.fromJson(json['user']),
        freelanceUser: UserModel.fromJson(
            json['freelanceUser']), // Convertir le JSON en UserModel
        freelance: FreelanceModel.fromJson(json['freelance']),
        lastMessage: MessageModel.fromJson(
            json['lastMessage']) // Convertir le JSON en FreelanceModel
        );
  }
}
