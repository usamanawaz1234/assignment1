import 'package:flutter/material.dart';
import 'package:project_for_prac/widget/Drawer.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Page 2'),
      ),
      drawer: DrawerWidget(),
      body: const Center(
        child: Text(
          'Welcome to Page 2',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
