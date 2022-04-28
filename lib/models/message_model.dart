//class message model
class MessageModel {
  String? message;
  String? sender;
  String? receiver;
  String? date;

  MessageModel({
    this.message,
    this.sender,
    this.receiver,
    this.date,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        sender: json["sender"],
        receiver: json["receiver"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sender": sender,
        "receiver": receiver,
        "date": date,
      };
}
