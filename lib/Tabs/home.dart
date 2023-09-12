// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CardItem {
  final String AssetImage;
  final String title;
  final String subtitle;
  const CardItem(
      {required this.AssetImage, required this.title, required this.subtitle});
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CardItem> items = [
    CardItem(
      AssetImage: 'assets/batman.jpg',
      title: 'Batman 2',
      subtitle: '\$49',
    ),
    CardItem(
      AssetImage: 'assets/bignate.jpg',
      title: 'Bignate',
      subtitle: '\$20',
    ),
    CardItem(
      AssetImage: 'assets/boondocks.jpg',
      title: 'Boondocks',
      subtitle: '\$39',
    ),
    CardItem(
      AssetImage: 'assets/spiderman.jpg',
      title: 'The Amazing Spiderman',
      subtitle: '\$66',
    ),
    CardItem(
      AssetImage: 'assets/x_men.jpg',
      title: 'The X-men',
      subtitle: '\$45',
    ),
    CardItem(
      AssetImage: 'assets/titans.jpg',
      title: 'The Titans',
      subtitle: '\$55',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.screenHeight * 0.1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
                  "Top Comics".text.size(19).bold.align(TextAlign.left).make(),
            ),
            IconButton(onPressed: () {}, icon: Icon(EvaIcons.arrowForward)),
          ],
        ),
        SizedBox(
          height: 256,
          child: Expanded(
            child: ListView.separated(
                padding: EdgeInsets.all(16),
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                separatorBuilder: (context, index) => SizedBox(width: 12),
                itemBuilder: (context, index) => buildCard(item: items[index])),
          ),
        ),
      ],
    );
  }
}

Widget buildCard({required CardItem item}) => Container(
      width: 300,
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Material(
                  child: Ink.image(
                    image: AssetImage(item.AssetImage),
                    fit: BoxFit.cover,
                    child: InkWell(
                      onTap: () {},
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            item.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            item.subtitle,
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
