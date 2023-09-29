import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../utils/classes.dart';
import 'comic_read.dart';

class AboutScreen extends StatefulWidget {
  final bool isDark;
  final int index;
  final CardItem item;
  final Color dominantColor;
  const AboutScreen({super.key, required this.isDark, required this.index, required this.item, required this.dominantColor});

  @override
  State<AboutScreen> createState() => AboutcScreenState();
}

const List<Tab> myTabs = <Tab>[
  Tab(text: 'About'),
  Tab(text: 'Episodes'),
];

class AboutcScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
        automaticallyImplyLeading: true,
        backgroundColor: widget.isDark ? ThemeData.dark().scaffoldBackgroundColor : ThemeData.light().scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
              automaticallyImplyLeading: true,
              backgroundColor: widget.isDark ? ThemeData.dark().scaffoldBackgroundColor : ThemeData.light().scaffoldBackgroundColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(context.screenHeight * 0.3),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Image.asset(
                        items[widget.index].assetImage,
                        height: context.screenWidth * 0.4,
                        width: context.screenWidth * 0.4,
                      ),
                    ),
                    widget.item.title.text.scale(2).bold.center.make(),
                    widget.item.genre.text.scale(1.2).semiBold.color(widget.isDark ? Colors.grey.shade300 : Colors.grey.shade800).make(),
                    SizedBox(height: context.screenHeight * 0.02),
                    Container(
                      height: context.screenHeight * 0.072,
                      width: context.screenWidth * 0.65,
                      child: TabBar(
                        splashBorderRadius: BorderRadius.circular(18),
                        onTap: (value) {},
                        labelColor: widget.isDark ? Colors.white : Colors.black,
                        unselectedLabelColor: widget.isDark ? Colors.grey.shade400 : Colors.grey.shade900,
                        labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                        unselectedLabelStyle: TextStyle(fontSize: 13),
                        tabs: myTabs,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorWeight: 4,
                        indicatorColor: widget.dominantColor.withOpacity(.7),
                      ),
                    ),
                  ],
                ),
              ),
              // title:
            ),
            SliverToBoxAdapter(
              child: TabBarView(
                physics: BouncingScrollPhysics(),
                children: [
                  Column(
                    children: [
                      items[widget.index].about.text.align(TextAlign.center).semiBold.scale(1.4).make().px8().py4(),
                    ],
                  ),
                  ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 6,
                            backgroundColor: !widget.isDark ? widget.dominantColor : Colors.white,
                          ),
                          title: "Episode ${index + 1}".text.scale(1.23).semiBold.make(),
                          onTap: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => ComicRead(
                                          isDark: widget.isDark,
                                          comic: items[widget.index],
                                          epNum: index + 1,
                                        )));
                          },
                          tileColor: widget.dominantColor.withOpacity(.5),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ).py4().px8();
                      })
                ],
              ).box.width(context.screenWidth).height(context.screenHeight * 0.53).make(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Row(
          children: [
            Icon(
              EvaIcons.book,
              color: Colors.white,
            ),
            "Read Now".text.white.scale(1.1).make().px8(),
          ],
        ),
        backgroundColor: widget.dominantColor.withRed(50),
      ),
    );
  }
}
