// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:palette_generator/palette_generator.dart';
import '../utils/classes.dart';

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

  Future<PaletteGenerator> generatePalette(String imageUrl) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      AssetImage(imageUrl),
      size: Size(50, 50), // You can specify the size for analysis.
    );

    return paletteGenerator;
  }

  Widget buildCard({required CardItem item}) => InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          final String imageUrl = item.assetImage; // Replace with your image URL
          final PaletteGenerator palette = await generatePalette(imageUrl);
          Color dominantColor = palette.dominantColor!.color;
          Navigator.push(context, MaterialPageRoute(builder: (contex) => intro(item: item, dominantColor: dominantColor)));
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

  Widget intro({required CardItem item, required Color dominantColor}) => Material(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: dominantColor.withOpacity(.8),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            height: context.screenHeight,
            width: context.screenWidth,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.transparent, Colors.grey.shade900], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
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
                  item.title.text.scale(2).bold.center.make(),
                  item.genre.text.scale(1.5).semiBold.gray400.make(),
                ],
              ),
            ),
          ),
        ),
      );
}
