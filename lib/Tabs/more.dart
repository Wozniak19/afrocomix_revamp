import 'package:afrocomix/services/theme_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switcher_button/switcher_button.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Pages/log_in.dart';

class More extends StatelessWidget {
  const More({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeModal themeNotifier, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: "Settings".text.scale(1.5).color(themeNotifier.isDark ? Colors.white : Colors.black).make(),
            centerTitle: true,
            // actions: [
            //   IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.search),
            //   ),
            // ],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: context.screenHeight * 0.02,
                ),
                topic(name: "Account", context: context, isDark: themeNotifier.isDark),
                ListTile(
                  title: const Text("Log in"),
                  trailing: const Icon(EvaIcons.arrowIosForward),
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LogIn(
                                  isDark: themeNotifier.isDark,
                                )));
                  },
                ),
                const Divider().px16(),
                const ListTile(
                  title: Text("Register"),
                  trailing: Icon(EvaIcons.arrowIosForward),
                ),
                topic(name: "OPTIONS", context: context, isDark: themeNotifier.isDark),
                ListTile(
                  title: const Text("Switch language"),
                  trailing: const Icon(EvaIcons.arrowIosForward),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return slideBox(name: "Select language", context: context, isDark: themeNotifier.isDark, items: [
                            "English",
                            "French",
                            "Spanish",
                            "Russian",
                            "Portuguese",
                          ]);
                        });
                  },
                ),
                const Divider().px16(),
                ListTile(
                  title: const Text("Image resolution"),
                  trailing: const Icon(EvaIcons.arrowIosForward),
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return slideBox(name: "Select resolution", context: context, isDark: themeNotifier.isDark, items: [
                            "High quality",
                            "Medium qualty",
                            "Low quality",
                          ]);
                        });
                  },
                ),
                const Divider().px16(),
                ListTile(
                  title: const Text("Clear cache"),
                  trailing: "15 MB".text.make(),
                ),
                topic(name: "THEME", context: context, isDark: themeNotifier.isDark),
                ListTile(
                  title: const Text("Dark theme"),
                  trailing: SwitcherButton(
                    onColor: Colors.black,
                    offColor: Colors.amber,
                    value: themeNotifier.isDark ? true : false,
                    onChange: (value) {
                      themeNotifier.isDark = !themeNotifier.isDark;
                    },
                  ),
                ),
                topic(name: "ABOUT", context: context, isDark: themeNotifier.isDark),
                const ListTile(
                  title: Text("Help"),
                  trailing: Icon(EvaIcons.arrowIosForward),
                ),
                const Divider().px16(),
                const ListTile(
                  title: Text("Privacy policy"),
                  trailing: Icon(EvaIcons.arrowIosForward),
                ),
                const Divider().px16(),
                const ListTile(
                  title: Text("Open source license"),
                  trailing: Icon(EvaIcons.arrowIosForward),
                ),
                const Divider().px16(),
                ListTile(
                  title: const Text("App version"),
                  trailing: "1.0.3".text.make(),
                ),
                const Divider().px20(),
                SizedBox(
                  height: context.screenHeight * 0.04,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget topic({required String name, required BuildContext context, required bool isDark}) {
    return Container(
      height: context.screenHeight * 0.06,
      width: context.screenWidth,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade400, width: .2),
          bottom: BorderSide(color: Colors.grey.shade400, width: .2),
        ),
        color: isDark ? Colors.grey.shade800.withOpacity(.3) : Colors.grey.shade200,
      ),
      alignment: Alignment.centerLeft,
      child: name.text.scale(1.24).semiBold.make().px12(),
    );
  }

  Widget slideBox({required String name, required BuildContext context, required bool isDark, required List items}) {
    return Container(
      height: context.screenHeight * .6,
      width: context.screenWidth,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey.shade900 : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          name.text.scale(1.4).semiBold.align(TextAlign.left).make(),
          Divider(
            color: isDark ? Colors.grey : Colors.black,
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: List.generate(
                items.length,
                (index) => ListTile(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  title: Text(items[index]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
