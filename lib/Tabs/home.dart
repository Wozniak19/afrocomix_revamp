// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: context.screenHeight * 0.4,
            width: context.screenWidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.brown, Colors.transparent, Colors.brown], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Image.asset(
                'assets/boondocks.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
