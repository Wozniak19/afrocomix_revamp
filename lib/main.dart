import 'package:flutter/material.dart';

void main() {
  runApp(const afroComix());
}

class afroComix extends StatefulWidget {
  const afroComix({super.key});

  @override
  State<afroComix> createState() => _afroComixState();
}

class _afroComixState extends State<afroComix> {
  @override
  static final String title = 'Afrocomix';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
            ),
            // backgroundColor: Colors.amber.shade300,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                print('hello');
              },
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
              )
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft),
              ),
            ),
            elevation: 20, // titleSpacing: 6,
            bottom: TabBar(
              // isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
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
          body: SafeArea(
            child: TabBarView(
              children: [
                buildPage('Home Page'),
                buildPage('Feed Page'),
                buildPage('Profile Page'),
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
