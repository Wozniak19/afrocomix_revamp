// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:afrocomix/Widget/top_hits.dart';
import 'package:afrocomix/main.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widget/genre_tile.dart';
import '../Widget/releases.dart';
import '../services/theme_model.dart';
import '../utils/classes.dart';
import '../Widget/scroll_card.dart';
import '../utils/variables.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // AfroComix.of(context).changeTheme(ThemeData.light());
    return Consumer(builder: (context, ThemeModal themeNotifier, child) {
      return Scaffold(
        drawer: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
          child: Drawer(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Image.asset(
                    'assets/Letiarts_Logo.png',
                    height: 25,
                  ),
                ),
                ListTile(
                  title: "Dark Mode".text.semiBold.scale(1.4).make(),
                  trailing: SwitcherButton(
                    onColor: Colors.black,
                    offColor: Colors.amber,
                    value: themeNotifier.isDark ? true : false,
                    onChange: (value) {
                      themeNotifier.isDark = !themeNotifier.isDark;
                    },
                  ),
                ),
                // SwitchListTile(
                //     value: darkTheme,
                //     ),
              ],
            ),
          ),
        ),
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          centerTitle: true,
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Top Hits
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: "Top hits".text.size(19).bold.align(TextAlign.left).make(),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
                ],
              ),
              TopHits(
                isDark: themeNotifier.isDark,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              //Top comics
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
                              Navigator.push(context, MaterialPageRoute(builder: (contex) => intro(item: items[index], index: index, context: context)));
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
                                        child: ("${index + 1}.")
                                            .toString()
                                            .text
                                            .scale(1.5)
                                            .bold
                                            // .color(index + 1 == 1 ? Colors.amber : Colors.white)
                                            .center
                                            .make(),
                                      ),
                                    ),
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
                                        comicsList[index].name.text.semiBold.scale(1.2).overflow(TextOverflow.ellipsis).make(),
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
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              //Explore some genres
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: "Explore some genres".text.size(19).bold.align(TextAlign.left).make(),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
                ],
              ),
              GenreTile(),
              //New releases
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
              SizedBox(
                height: context.screenHeight * 0.03,
              ),
              //New Releases
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: "Hot news".text.size(19).bold.align(TextAlign.left).make(),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
                ],
              ),
              Releases(),
              SizedBox(
                height: context.screenHeight * 0.03,
              ),

              SizedBox(
                height: context.screenHeight * .1,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget intro({required CardItem item, required int index, required BuildContext context}) => Material(
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
                  item.title.text.scale(2).bold.center.make(),
                  item.genre.text.scale(1.2).semiBold.gray400.make(),
                ],
              ),
            ),
          ),
        ),
      );
}
