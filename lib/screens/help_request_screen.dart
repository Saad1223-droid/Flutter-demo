import 'package:flutter/material.dart';
import '../widgets/help_request_card.dart';
import '../models/help_request.dart';
import 'create_request_screen.dart';
import '../services/db_helper.dart';

class HelpRequestScreen extends StatefulWidget {
  @override
  _HelpRequestScreenState createState() => _HelpRequestScreenState();
}

class _HelpRequestScreenState extends State<HelpRequestScreen> {
  List<HelpRequest> requests = [];

  @override
  void initState() {
    super.initState();
    _loadRequests();
  }

  Future<void> _loadRequests() async {
    final data = await DBHelper().getRequests();
    setState(() {
      requests = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Help Requests")),
      body: requests.isEmpty
          ? Center(child: Text("No requests yet"))
          : ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          return HelpRequestCard(
            request: requests[index],
            onUpdated: _loadRequests, // refresh after offer
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final added = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateRequestScreen()),
          );
          if (added == true) {
            _loadRequests();
          }
        },
      ),
    );
  }
}
