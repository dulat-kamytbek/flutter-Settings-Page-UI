import 'package:flutter/material.dart';
import 'package:flutter_setting_page_ui/SettingScreen.dart';
import 'theme_manager.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter bindings
  ThemeMode themeMode = await ThemeManager.loadTheme(); // Load the theme
  runApp(MyApp(themeMode));
}

class MyApp extends StatelessWidget { 
  final ThemeMode themeMode;

  MyApp(this.themeMode);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Setting UI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),


      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage('assets/user_avatar.png'), // or NetworkImage
      ),
      SizedBox(height: 10),
      Text(
        'User Name',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      Text(
        'user@example.com',
        style: TextStyle(color: Colors.white54, fontSize: 14),
      ),
    ],
  ),
  decoration: BoxDecoration(
    color: Colors.blue,
  ),
),
            ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            ),
            Divider(height: 0, thickness: 1),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingScreen()),
                );
              },
            ),
            Divider(height: 0, thickness: 1),
            ListTile(
              title: Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      
    );
  }
}


