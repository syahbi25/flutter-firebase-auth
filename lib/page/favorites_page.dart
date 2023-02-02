import 'package:flutter/material.dart';
import 'package:project/page/home_page.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: Colors.green,
        ),
      );
}
