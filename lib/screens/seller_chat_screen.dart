import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seller_chat_pks/models/message.dart'; // Импорт модели сообщений

class SellerChatScreen extends StatefulWidget {
  final String chatId; // Идентификатор чата

  const SellerChatScreen({super.key, required this.chatId});

  @override
  _SellerChatScreenState createState() => _SellerChatScreenState();
}

class _SellerChatScreenState extends State<SellerChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Чат с покупателем'),
      ),
      body: Column(
        children: [
          // Отображение сообщений
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(widget.chatId) // Идентификатор чата
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Ошибка: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('Нет сообщений'));
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data!.docs[index];
                    final message = Message.fromMap(doc.data() as Map<String, dynamic>);
                    return ListTile(
                      title: Text(message.senderName),
                      subtitle: Text(message.text),
                      trailing: Text(message.timestamp.toString()),
                    );
                  },
                );
              },
            ),
          ),
          // Поле ввода сообщения и кнопка отправки
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Введите сообщение',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Логика отправки сообщения
                    _sendMessage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() async {
    String messageText = _messageController.text.trim();

    if (messageText.isEmpty) return;

    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    Message message = Message(
      senderId: user.uid,
      senderName: 'Продавец', // Замените на имя продавца
      text: messageText,
      timestamp: DateTime.now(),
    );

    await FirebaseFirestore.instance
        .collection('chats')
        .doc(widget.chatId) // Идентификатор чата
        .collection('messages')
        .add(message.toMap());

    _messageController.clear();
  }
}