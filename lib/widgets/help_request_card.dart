import 'package:flutter/material.dart';
import '../models/help_request.dart';
import '../screens/request_details_screen.dart';

class HelpRequestCard extends StatelessWidget {
  final HelpRequest request;
  final VoidCallback onRefresh; // ✅ callback to refresh parent list

  HelpRequestCard({required this.request, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Icon(
          request.category == "Study"
              ? Icons.menu_book
              : request.category == "Food"
              ? Icons.fastfood
              : request.category == "Jobs"
              ? Icons.work
              : Icons.help,
          color: Colors.blue,
        ),
        title: Text(
          request.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(request.details),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RequestDetailsScreen(request: request),
            ),
          );

          if (result == true) {
            onRefresh(); // ✅ refresh when Offer Help was tapped
          }
        },
      ),
    );
  }
}
