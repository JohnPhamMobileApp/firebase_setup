import 'package:flutter/material.dart';
import 'profile_page.dart'; // Profile page
import 'settings_page.dart'; // Settings page
import 'login_page.dart'; // Login page for logging out

class HomePage extends StatelessWidget {
  final String title;

  
  HomePage({super.key, required this.title});

  // Hardcoded message boards data
  final List<Map<String, String>> messageBoards = [
    {
      'name': 'Technology',
      'icon': 'assets/tech_icon.png', 
    },
    {
      'name': 'Sports',
      'icon': 'assets/sports_icon.png',
    },
    {
      'name': 'Music',
      'icon': 'assets/music_icon.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: Builder(
          builder: (BuildContext context) {
           
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                // Open the drawer using the new context
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'User Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Message Boards'),
              onTap: () {
                // Close the drawer when this menu item is tapped
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Log Out'),
              onTap: () {
                // Log the user out and navigate to LoginPage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Message Boards',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: messageBoards.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(messageBoards[index]['icon']!),
                      ),
                      title: Text(messageBoards[index]['name']!),
                      onTap: () {
                        
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Selected board: ${messageBoards[index]['name']}')),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
