import "package:flutter/material.dart";
import "package:project_for_prac/views/login_view.dart";
import "package:project_for_prac/views/page1_view.dart";
import "package:project_for_prac/views/page2_view.dart";

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Page1()),
              );
            },
          ),
          ListTile(
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Page2()),
              );
            },
          ),
          const Divider(), // Adds a line separator
          ListTile(
            leading: const Icon(Icons.logout), // Adds an icon
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}
