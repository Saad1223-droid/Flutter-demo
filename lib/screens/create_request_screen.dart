import 'package:flutter/material.dart';
import '../models/help_request.dart';

class CreateRequestScreen extends StatefulWidget {
  @override
  _CreateRequestScreenState createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _details = '';
  String _category = 'Study';

  final List<String> _categories = ['Study', 'Food', 'Jobs', 'General'];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newRequest = HelpRequest(
        title: _title,
        category: _category,
        details: _details,
      );
      Navigator.pop(context, newRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Help Request")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Title"),
                onSaved: (value) => _title = value!,
                validator: (value) => value!.isEmpty ? "Please enter a title" : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField(
                value: _category,
                items: _categories
                    .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
                    .toList(),
                onChanged: (value) => setState(() => _category = value as String),
                decoration: InputDecoration(labelText: "Category"),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(labelText: "Details"),
                maxLines: 3,
                onSaved: (value) => _details = value!,
                validator: (value) => value!.isEmpty ? "Please provide more information" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text("Post Request"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
