import 'package:afrocomix/utils/variables.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';

class Genre extends StatefulWidget {
  final bool isDark;
  const Genre({super.key, required this.isDark});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: allGenres.length,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
          backgroundColor: Colors.transparent,
          title: "Genres".text.color(widget.isDark ? Colors.white : Colors.black).scale(1.5).make(),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
          elevation: 0,
          bottom: TabBar(
            onTap: (value) {
              setState(() {
                currentGenre = value;
              });
            },
            splashBorderRadius: BorderRadius.circular(15),
            isScrollable: true,
            indicatorColor: Colors.amber,
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            labelStyle: TextStyle(color: widget.isDark ? Colors.white : Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
            unselectedLabelStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4,
            labelColor: widget.isDark ? Colors.white : Colors.black,
            unselectedLabelColor: widget.isDark ? Colors.grey.shade400 : Colors.grey.shade600,
            tabs: List.generate(
              allGenres.length,
              (index) => Tab(
                text: allGenres[index].name,
              ),
            ),
          ),
        ),
        body: TabBarView(children: List.generate(allGenres.length, (index) => genreTab(index, 19, widget.isDark))),
      ),
    );
  }

  Widget genreTab(index, number, isDark) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "$number items".text.scale(.9).make(),
              ],
            ),
          ),
          Wrap(
            children: List.generate(number, (index) => comicContainer(isDark: isDark)),
          )
        ],
      ),
    );
  }

  Widget comicContainer({required bool isDark}) {
    return Container(
      height: context.screenHeight * 0.1,
      width: context.screenHeight * 0.1,
      margin: const EdgeInsets.symmetric(horizontal: 2.5, vertical: 4),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(.1) : Colors.black.withOpacity(.3),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}
