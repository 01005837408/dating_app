class MessageModel {
  String content;
  String data;
  String senderId;
 
  // DateTime date;

  MessageModel({required this.content, required this.data , required this.senderId});

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'data': data,
      'senderId': senderId,
     
      // 'date': date.toIso8601String(),
    };
  }

 factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      content: map['content'] ?? '',
      data: map['data'] ?? '',
      senderId: map['senderId'] ?? '',
     
      // date: map['date'] != null ? DateTime.parse(map['date']) : DateTime.now(),
    );
  }
  
}
