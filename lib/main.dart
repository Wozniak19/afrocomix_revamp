// ignore_for_file: prefer_const_constructors

import 'package:afrocomix/Tabs/home.dart';
import 'package:flutter/material.dart';

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
          //             height: 100,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/Letiarts_Logo.png',
                height: 20,
              ),
            ),
            actions: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(.4)),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
              ),
            ],
            elevation: 0,
          ),
          body: TabBarView(
            children: [
              Home(),
              buildPage('Feed Page'),
              buildPage('Profile Page'),
            ],
          ),
          bottomNavigationBar: Container(
            color: Colors.red,
            child: TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Feed',
                ),
                Tab(
                  icon: Icon(Icons.face),
                  text: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPage(String text) => Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 28),
        ),
      );
}
