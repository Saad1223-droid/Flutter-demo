import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  final String userName = "John Doe";
  final String userEmail = "johndoe@campushub.edu";
  final String userBio = "Computer Science student | Loves coding & coffee";
  final List<String> interests = ["Flutter", "AI", "Hiking"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          CircleAvatar(radius: 50, backgroundImage: AssetImage('assets/avatar.png')),
          SizedBox(height: 10),
          Text(userName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(userEmail, style: TextStyle(color: Colors.grey)),
          SizedBox(height: 15),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(userBio, textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
          ),
          SizedBox(height: 20),
          Text("Interests", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Wrap(
            spacing: 10,
            children: interests.map((interest) => Chip(label: Text(interest))).toList(),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfileScreen()),
              );
            },
            child: Text("Edit Profile"),
          ),
        ],
      ),
    );
  }
}
