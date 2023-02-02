// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/page/favorites_page.dart';
import 'package:project/page/user_page.dart';

final user = FirebaseAuth.instance.currentUser!;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Colors.green.shade700,
        ),
        drawer: const NavigationDrawer(),
      );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.green.shade700,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              CircleAvatar(
                radius: 56,
                backgroundColor: Colors.white12,
                child: Padding(
                  padding: const EdgeInsets.all(8), // Border radius
                  child: ClipOval(
                    child: const FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.email!,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(14),
        child: Wrap(
          runSpacing: 2,
          children: [
            ListTile(
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: const Text('Home'),
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
                title: const Text('Favorites'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const FavoritesPage(),
                    ),
                  );
                }),
            ListTile(
              leading: const Icon(
                Icons.workspaces_outline,
                color: Colors.white,
              ),
              title: const Text('Workflow'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.update,
                color: Colors.white,
              ),
              title: const Text('Update'),
              onTap: () {},
            ),
            const Divider(
              color: Colors.black54,
            ),
            ListTile(
                leading: const Icon(
                  Icons.people_outlined,
                  color: Colors.white,
                ),
                title: const Text('User'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserPage(),
                    ),
                  );
                }),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.red,
              ),
              title: const Text('Logout'),
              textColor: Colors.red,
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      );
}
