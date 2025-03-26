import 'package:flutter/material.dart';
import '../models/help_request.dart';

class HelpRequestCard extends StatelessWidget {
  final HelpRequest request;
  HelpRequestCard({required this.request});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          request.category == "Study" ? Icons.menu_book :
          request.category == "Food" ? Icons.fastfood :
          request.category == "Jobs" ? Icons.work : Icons.help,
          color: Colors.blue,
        ),
        title: Text(request.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(request.details),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          // TODO: Navigate to request details
        },
      ),
    );
  }
}
