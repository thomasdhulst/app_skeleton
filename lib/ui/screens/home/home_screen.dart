import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TITRE DE LA HOMEPAGE')),
      body: const Center(
        child: Icon(
          Icons.favorite,
        ),
      ),
    );
  }
}
