import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AISupportedBuddY'),
        backgroundColor: Color.fromARGB(255, 22, 16, 46),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                'Welcome to Our App!',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'We are a team of passionate individuals dedicated to creating innovative and user-friendly applications. Our goal is to make a positive impact on people\'s lives through technology.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Our Team:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildTeamMember('Gargi Sinha', 'Lead Developer'),
            _buildTeamMember('Khushi Sinha', 'Backend developer'),
            _buildTeamMember('Megha Kaushal', 'UI Designer'),
            _buildTeamMember('Kushagra Sinha', 'UI Developer'),
            SizedBox(height: 20.0),
            Text(
              'Contact Us:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            _buildContactInfo('Email', 'info@example.com'),
            _buildContactInfo('Phone', '123-456-7890'),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '$name - $role',
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget _buildContactInfo(String type, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Text(
            '$type: ',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
