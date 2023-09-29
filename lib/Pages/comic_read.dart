import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';

class ComicRead extends StatefulWidget {
  final bool isDark;
  final CardItem comic;
  final int epNum;

  const ComicRead({super.key, required this.isDark, required this.comic, required this.epNum});

  @override
  State<ComicRead> createState() => _ComicReadState();
}

class _ComicReadState extends State<ComicRead> {
  @override
  Widget build(BuildContext context) {
    bool isDark = widget.isDark;
    CardItem comic = widget.comic;
    int epNum = widget.epNum;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
            backgroundColor: isDark ? Colors.grey.shade800 : ThemeData.light().scaffoldBackgroundColor,
            // snap: true,
            floating: true,
            title: "Episode $epNum".text.semiBold.makeCentered(),
            centerTitle: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: context.screenHeight,
            ),
          ),
        ],
      ),
    );
  }
}
