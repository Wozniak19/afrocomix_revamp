// ignore_for_file: prefer_const_constructors

import 'package:afrocomix/Tabs/home.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:afrocomix/utils/variables.dart';
import 'package:flutter/services.dart';

import 'Tabs/genre.dart';
import 'Tabs/more.dart';
import 'Tabs/my_activities.dart';
import 'Tabs/schedule.dart';
import 'services/theme_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const AfroComix());
}

class AfroComix extends StatefulWidget {
  const AfroComix({super.key});

  @override
  State<AfroComix> createState() => _AfroComixState();
}

String title = 'Afrocomix';

class _AfroComixState extends State<AfroComix> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeModal(),
      child: Consumer(builder: (context, ThemeModal themeModal, child) {
        List<Widget> pages = [
          Home(),
          Schedule(
            isDark: themeModal.isDark,
          ),
          Genre(
            isDark: themeModal.isDark,
          ),
          MyActivities(
            isDark: themeModal.isDark,
          ),
          More(),
        ];
        return MaterialApp(
          theme: themeModal.isDark ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          home: Consumer(
            builder: (context, ThemeModal themeNotifier, child) {
              return DefaultTabController(
                length: 3,
                child: Scaffold(
                  body: pages[currentPage],
                  bottomNavigationBar: Container(
                    color: themeNotifier.isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: NavigationBar(
                      backgroundColor: themeNotifier.isDark ? Colors.grey.shade800 : Colors.grey.shade300,
                      elevation: 0,
                      destinations: [
                        NavigationDestination(icon: Icon(EvaIcons.heartOutline), label: 'For you').px(2.5),
                        NavigationDestination(icon: Icon(EvaIcons.calendar), label: 'Schedule').px(2.5),
                        NavigationDestination(icon: Icon(EvaIcons.list), label: 'Genre').px(2.5),
                        NavigationDestination(icon: Icon(EvaIcons.person), label: 'My').px(2.5),
                        NavigationDestination(icon: Icon(EvaIcons.moreHorizontal), label: 'More').px(2.5),
                      ],
                      indicatorColor: Colors.orange.shade500,
                      selectedIndex: currentPage,
                      onDestinationSelected: (value) {
                        setState(() {
                          currentPage = value;
                        });
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}

Widget buildPage(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ),
    );
