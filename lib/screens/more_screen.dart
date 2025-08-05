// lib/screens/more_screen.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(FontAwesomeIcons.cog),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.user),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.infoCircle),
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.envelope),
            title: Text('Feedback'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.fileContract),
            title: Text('Terms of Service'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.lock),
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          SizedBox(height: 24),
          Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
