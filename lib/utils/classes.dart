// ignore_for_file: prefer_const_constructors
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String assetImage;
  final String title;
  final String price;
  final String genre;
  final int episodeNum;
  final String about;
  final String id;
  const CardItem(
      {required this.episodeNum,
      required this.id,
      required this.about,
      required this.assetImage,
      required this.title,
      required this.price,
      required this.genre});
}

class Comics {
  final String name;
  final int pages;
  final String genre;
  final String assets;

  Comics({required this.name, required this.pages, required this.genre, required this.assets});
}

class Genres {
  final String name;
  final IconData icon;
  final Color color;
  Genres({required this.name, required this.icon, required this.color});
}

List<Genres> allGenres = [
  Genres(name: "All", icon: Icons.backup_table_sharp, color: Colors.deepPurple),
  Genres(name: "Action", icon: Icons.track_changes_outlined, color: Colors.red),
  Genres(name: "Comedy", icon: Icons.emoji_emotions, color: Colors.yellow),
  Genres(name: "Supernatural", icon: Icons.man_2_rounded, color: Colors.green),
  Genres(name: "Romance", icon: EvaIcons.heart, color: Colors.pink),
  Genres(name: "Informative", icon: Icons.filter_b_and_w_sharp, color: Colors.orange),
  Genres(name: "Drama", icon: Icons.dark_mode_sharp, color: Colors.black38),
  Genres(name: "Fantasy", icon: Icons.star_border, color: Colors.cyan),
  Genres(name: "Slice of life", icon: Icons.sunny, color: Colors.purple),
  Genres(name: "Superhero", icon: Icons.star_half_rounded, color: Colors.purple),
  Genres(name: "Sci-fi", icon: Icons.catching_pokemon, color: Colors.orange),
  Genres(name: "Thriller", icon: Icons.run_circle_outlined, color: Colors.grey),
  Genres(name: "Mystery", icon: Icons.multitrack_audio_rounded, color: Colors.blue),
  Genres(name: "Sports", icon: Icons.games, color: Colors.limeAccent),
  Genres(name: "Historical", icon: Icons.account_balance_outlined, color: Colors.indigo),
  Genres(name: "Heart-warming", icon: Icons.heart_broken, color: Colors.teal),
];
// List<Comics> comicsList = [
//   Comics(
//     name: 'Spider-Man',
//     pages: 32,
//     genre: 'Action',
//     assets: 'assets/spiderman.png',
//   ),
//   Comics(
//     name: 'Batman',
//     pages: 28,
//     genre: 'Action',
//     assets: 'assets/batman.png',
//   ),
//   Comics(
//     name: 'X-Men',
//     pages: 36,
//     genre: 'Action',
//     assets: 'assets/xmen.png',
//   ),
// ];
List<CardItem> items = [
  CardItem(
    id: "amaz_spid",
    episodeNum: 18,
    about:
        "After Peter Parker is bitten by a genetically altered spider, he gains newfound, spider-like powers and ventures out to save the city from the machinations of a mysterious reptilian foe.",
    assetImage: 'assets/spiderman.png',
    title: 'The Amazing Spiderman',
    price: '\$ 66',
    genre: 'Action',
  ),
  CardItem(
    id: "x_men",
    episodeNum: 62,
    about:
        "They are children of the atom, homo superior, the next link in the chain of evolution. Each was born with a unique genetic mutation, which at puberty manifested itself in extraordinary powers. In a world filled with hate and prejudice, they are feared by those who cannot accept their differences. Led by Xavier the X-Men fight to protect a world that fears them. They are locked in a battle with former colleague and friend, Magneto who believes humans and mutants should never co-exist.",
    assetImage: 'assets/xmen.png',
    title: 'The X-men',
    price: '\$ 45',
    genre: 'Action',
  ),
  CardItem(
    id: "batm",
    episodeNum: 25,
    about:
        "After witnessing the murder of his parents Dr. Thomas Wayne and Martha Wayne as a child, he swore vengeance against criminals, an oath tempered by a sense of justice. Bruce Wayne trains himself physically and intellectually and crafts a bat-inspired persona to fight crime.",
    assetImage: 'assets/batman.png',
    title: 'Batman 2',
    price: '\$ 49',
    genre: 'Action',
  ),
];

// ThemeData(brightness: darkTheme ? Brightness.dark : Brightness.light)