import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Schedule extends StatelessWidget {
  final bool isDark;
  const Schedule({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        title: "Daily Schedules".text.scale(1.5).color(isDark ? Colors.white : Colors.black).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
