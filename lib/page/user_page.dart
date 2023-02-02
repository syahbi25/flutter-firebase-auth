import 'package:flutter/material.dart';
import 'package:project/page/home_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('User'),
          backgroundColor: Colors.green,
        ),
      );
}
