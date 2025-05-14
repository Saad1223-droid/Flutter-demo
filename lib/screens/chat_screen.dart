import 'package:flutter/material.dart';
import 'chat_page.dart';

class ChatScreen extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {"name": "Alice Johnson", "lastMessage": "Hey! Are you still looking for a tutor?"},
    {"name": "Mark Lee", "lastMessage": "Thanks for the pizza!"},
    {"name": "Sophia Brown", "lastMessage": "Let's meet at the library at 5PM."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chats")),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(chats[index]["name"]![0])),
            title: Text(chats[index]["name"]!),
            subtitle: Text(chats[index]["lastMessage"]!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(userName: chats[index]["name"]!),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
