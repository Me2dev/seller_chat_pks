class Message {
  final String senderId;
  final String senderName;
  final String text;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.senderName,
    required this.text,
    required this.timestamp,
  });

  // Преобразование в Map для Firestore
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'text': text,
      'timestamp': timestamp,
    };
  }

  // Создание объекта из Firestore
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderId: map['senderId'],
      senderName: map['senderName'],
      text: map['text'],
      timestamp: map['timestamp'].toDate(),
    );
  }
}