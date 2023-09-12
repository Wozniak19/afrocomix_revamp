// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'classes.dart';

class ScrollCard extends StatefulWidget {
  const ScrollCard({super.key});

  @override
  State<ScrollCard> createState() => _ScrollCardState();
}

class _ScrollCardState extends State<ScrollCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (context, index) => SizedBox(width: 12),
          itemBuilder: (context, index) => buildCard(item: items[index])),
    );
  }

  Widget buildCard({required CardItem item}) => InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (contex) => intro(item: item)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          width: context.screenWidth * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: item.assetImage,
                child: Image.asset(
                  item.assetImage,
                  height: 120,
                  width: 120,
                ),
              ),
              SizedBox(height: 4),
              item.genre.text.scale(0.9).gray300.make(),
              // SizedBox.expand(),
              item.title.text.scale(1.2).align(TextAlign.center).bold.make(),
            ],
          ),
        ),
      );
  Widget intro({required CardItem item}) => Material(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: context.screenHeight,
            width: context.screenWidth,
            color: Colors.grey.shade900,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Hero(
                      tag: item.assetImage,
                      child: Image.asset(
                        item.assetImage,
                        height: context.screenWidth * 0.8,
                        width: context.screenWidth * 0.8,
                      ),
                    ),
                  ),
                  item.title.text.scale(2).bold.make(),
                  item.genre.text.scale(1.5).semiBold.gray400.make(),
                ],
              ),
            ),
          ),
        ),
      );
}
