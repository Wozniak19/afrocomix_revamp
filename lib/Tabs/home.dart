// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
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
          // Container(
          //   height: context.screenHeight * 0.4,
          //   width: context.screenWidth,
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(colors: [Colors.brown, Colors.transparent, Colors.brown], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 18.0),
          //     child: Image.asset(
          //       'assets/boondocks.jpg',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SizedBox(
            height: context.screenHeight * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: "Top Comics".text.size(19).bold.align(TextAlign.left).make(),
              ),
              IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
            ],
          ),
        ],
      ),
    );
  }
}
