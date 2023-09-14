// ignore_for_file: prefer_const_constructors

import 'package:afrocomix/Tabs/home.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:afrocomix/utils/variables.dart';

import 'Tabs/genre.dart';
import 'Tabs/schedule.dart';

void main() {
  runApp(const AfroComix());
}

class AfroComix extends StatefulWidget {
  const AfroComix({super.key});

  @override
  State<AfroComix> createState() => _AfroComixState();
}

class _AfroComixState extends State<AfroComix> {
  @override
  String title = 'Afrocomix';
  List<Widget> pages = [
    Home(),
    Schedule(),
    Genre(),
    buildPage('My Page'),
    buildPage('More Page'),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          // drawer: Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          //   child: Drawer(
          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          //     child: Column(
          //       children: [
          //         Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Image.asset(
          //             'assets/Letiarts_Logo.png',
          //             height: 25,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // extendBodyBehindAppBar: true,

          body: pages[currentPage],
          bottomNavigationBar: Container(
            color: Colors.grey.shade800,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: NavigationBar(
              backgroundColor: Colors.grey.shade800,
              elevation: 0,
              destinations: const [
                NavigationDestination(icon: Icon(EvaIcons.heartOutline), label: 'For you'),
                NavigationDestination(icon: Icon(EvaIcons.calendar), label: 'Schedule'),
                NavigationDestination(icon: Icon(EvaIcons.list), label: 'Genre'),
                NavigationDestination(icon: Icon(EvaIcons.person), label: 'My'),
                NavigationDestination(icon: Icon(EvaIcons.moreHorizontal), label: 'More'),
              ],
              indicatorColor: Colors.orange.shade500,
              selectedIndex: currentPage,
              onDestinationSelected: (value) {
                setState(() {
                  currentPage = value;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildPage(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
