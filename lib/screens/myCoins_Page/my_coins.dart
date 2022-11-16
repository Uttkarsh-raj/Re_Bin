import 'package:flutter/material.dart';

class MyCoinsPage extends StatefulWidget {
  const MyCoinsPage({super.key});

  @override
  State<MyCoinsPage> createState() => _MyCoinsPageState();
}

class _MyCoinsPageState extends State<MyCoinsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Re-Bin Coin',
          style: TextStyle(
            color: Color.fromARGB(248, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        backgroundColor: Colors.green[400],
      ),
    );
  }
}
