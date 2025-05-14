import 'package:flutter/material.dart';
import '../widgets/help_request_card.dart';
import '../models/help_request.dart';
import 'create_request_screen.dart';

class HelpRequestScreen extends StatefulWidget {
  @override
  _HelpRequestScreenState createState() => _HelpRequestScreenState();
}

class _HelpRequestScreenState extends State<HelpRequestScreen> {
  List<HelpRequest> requests = [
    HelpRequest(title: "Need a Study Partner", category: "Study", details: "Looking for someone to study Physics"),
    HelpRequest(title: "Free Pizza Leftover", category: "Food", details: "I have some extra slices, come grab!"),
    HelpRequest(title: "Part-time Tutor Needed", category: "Jobs", details: "Looking for a math tutor, \$15/hour"),
  ];

  void _addNewRequest(HelpRequest request) {
    setState(() {
      requests.add(request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help Requests")),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return HelpRequestCard(request: requests[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newRequest = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateRequestScreen()),
          );
          if (newRequest != null && newRequest is HelpRequest) {
            _addNewRequest(newRequest);
          }
        },
      ),
    );
  }
}
