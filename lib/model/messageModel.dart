class MessageModel {
  String senderId;
  String receiverId;
  String conversationId;
  String? body;
  bool? isRead;
  List<dynamic>? file;
  String? type;
  String? serviceId;
  String? orderId;
  String? proposalId;
  DateTime created_at;

  MessageModel(
      {required this.senderId,
      required this.receiverId,
      required this.conversationId,
      this.body,
      required this.isRead,
      required this.created_at
      //this.file,
      //required this.type,
      //this.serviceId,
      //this.orderId,
      //  this.proposalId,
      });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      conversationId: json['conversation_id'],
      body: json['body'],
      isRead: json['is_read'],
      created_at: DateTime.parse(json['created_at']),
      //file: json['file'],
      // type: json['type'],
      //serviceId: json['service_id'],
      //orderId: json['order_id'],
      //proposalId: json['proposal_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['conversation_id'] = this.conversationId;
    data['body'] = this.body;
    data['is_read'] = this.isRead;
    data['file'] = this.file;
    data['type'] = this.type;
    data['service_id'] = this.serviceId;
    data['order_id'] = this.orderId;
    data['proposal_id'] = this.proposalId;
    return data;
  }
}
