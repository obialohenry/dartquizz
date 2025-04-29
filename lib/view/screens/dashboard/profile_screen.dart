import 'package:dartquizz/src/components.dart';
import 'package:dartquizz/src/config.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF3F51B5)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Profile header
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0xFF3F51B5),
                  child: Text(
                    'U',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Username',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF212121),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          // Menu Options
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    _buildProfileMenuItem(
                      context,
                      icon: Icons.check, //TODO:CHANGE TO GITHUB ICON.
                      title: 'My GitHub',
                      onTap: () {},
                    ),
                    Divider(height: 1),
                    _buildProfileMenuItem(
                      context,
                      icon: Icons.download,
                      title: 'Download Source Code',
                      onTap: () {},
                    ),
                    Divider(height: 1),
                    _buildProfileMenuItem(
                      context,
                      icon: Icons.contact_mail,
                      title: 'Contact Me',
                      onTap: () {},
                    ),
                    Divider(height: 1),
                    _buildProfileMenuItem(
                      context,
                      icon: Icons.language,
                      title: 'Web',
                      onTap: () {},
                    ),
                    Divider(height: 1),
                    _buildProfileMenuItem(context, icon: Icons.email, title: 'Email', onTap: () {}),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF3F51B5)),
      title: Text(title, style: TextStyle(fontSize: 16, color: const Color(0xFF212121))),
      trailing: Icon(Icons.chevron_right, color: Colors.grey,
      ),
      onTap: onTap,
    );
  }
}
