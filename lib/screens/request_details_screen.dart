import 'package:flutter/material.dart';
import '../models/help_request.dart';
import '../services/db_helper.dart';

class RequestDetailsScreen extends StatelessWidget {
  final HelpRequest request;

  RequestDetailsScreen({required this.request});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(request.title)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Category: ${request.category}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Details:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(request.details, style: TextStyle(fontSize: 16)),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                await DBHelper().offerHelp(request.id!);
                Navigator.pop(context, true); // ✅ tell previous screen to refresh
              },
              child: Text("Offer Help"),
            ),
          ],
        ),
      ),
    );
  }
}
