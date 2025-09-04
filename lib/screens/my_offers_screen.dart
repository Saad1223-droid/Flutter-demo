import 'package:flutter/material.dart';
import '../widgets/help_request_card.dart';
import '../models/help_request.dart';
import '../services/db_helper.dart';

class MyOffersScreen extends StatefulWidget {
  @override
  _MyOffersScreenState createState() => _MyOffersScreenState();
}

class _MyOffersScreenState extends State<MyOffersScreen> {
  List<HelpRequest> offers = [];

  @override
  void initState() {
    super.initState();
    _loadOffers();
  }

  Future<void> _loadOffers() async {
    final data = await DBHelper().getOfferedRequests();
    setState(() {
      offers = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Offers")),
      body: offers.isEmpty
          ? Center(child: Text("You haven’t offered help yet"))
          : ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return HelpRequestCard(
            request: offers[index],
            onUpdated: _loadOffers, // refresh after changes
          );
        },
      ),
    );
  }
}
