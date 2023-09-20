import 'package:afrocomix/utils/variables.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyActivities extends StatefulWidget {
  final bool isDark;
  const MyActivities({super.key, required this.isDark});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> with SingleTickerProviderStateMixin {
  // TabController _tabController0 = TabController(length: 4, vsync: );
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Downloads'),
    Tab(text: 'Subcribed'),
    Tab(text: 'Recent'),
    Tab(text: 'Comments'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: widget.isDark ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        title: "My Activities".text.color(widget.isDark ? Colors.white : Colors.black).scale(1.5).make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_outline_rounded),
          ),
        ],
        elevation: 0,
        bottom: TabBar(
          onTap: (value) {
            setState(() {
              currentMyActivity = value;
            });
          },
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(15),
          isScrollable: true,
          indicatorColor: Colors.amber,
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          labelStyle: TextStyle(color: widget.isDark ? Colors.white : Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          unselectedLabelColor: widget.isDark ? Colors.grey.shade400 : Colors.grey.shade600,
          tabs: myTabs,
          labelColor: widget.isDark ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
