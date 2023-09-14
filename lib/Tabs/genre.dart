import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allGenres.length + 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: "Genres".text.scale(1.5).make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],
          elevation: 0,
          bottom: TabBar(
            tabs: List.generate(allGenres.length, (index) => Tab()),
          ),
        ),
      ),
    );
  }
}
