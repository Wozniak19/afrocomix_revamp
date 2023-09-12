// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';
import '../utils/scroll_card.dart';

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
          Container(
            height: context.screenHeight * 0.3,
            color: Colors.transparent,
            width: context.screenWidth,
            child: ListView.builder(
              // physics: FixedExtentScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: List.generate(
                    3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (contex) => intro(item: items[index], index: index)));
                        },
                        child: SizedBox(
                          width: context.screenWidth * 0.7,
                          height: context.screenHeight * 0.1,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                    backgroundColor: index + 1 == 1 ? Colors.black : Colors.transparent,
                                    child: Center(
                                        child: ("${index + 1}.").toString().text.scale(1.5).bold.color(index + 1 == 1 ? Colors.amber : Colors.white).make())),
                              ),
                              Image.asset(
                                comicsList[index].assets,
                                height: 50,
                                width: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    comicsList[index].name.text.semiBold.scale(1.2).make(),
                                    comicsList[index].genre.text.semiBold.scale(0.8).gray400.make(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: "New Releases".text.size(19).bold.align(TextAlign.left).make(),
              ),
              IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
            ],
          ),
          ScrollCard(),
        ],
      ),
    );
  }

  Widget intro({required CardItem item, required int index}) => Material(
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
                    child: Image.asset(
                      comicsList[index].assets,
                      height: context.screenWidth * 0.8,
                      width: context.screenWidth * 0.8,
                    ),
                  ),
                  item.title.text.scale(2).bold.make(),
                  item.genre.text.scale(1.2).semiBold.gray400.make(),
                ],
              ),
            ),
          ),
        ),
      );
}
