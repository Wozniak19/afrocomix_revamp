import 'package:afrocomix/utils/variables.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

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
        backgroundColor: Colors.transparent,
        title: "My Activities".text.scale(1.5).make(),
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
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
          unselectedLabelStyle: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 4,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey.shade400,
          tabs: myTabs,
        ),
      ),
    );
  }
}
