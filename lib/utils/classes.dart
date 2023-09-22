// ignore_for_file: prefer_const_constructors
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CardItem {
  final String assetImage;
  final String title;
  final String price;
  final String genre;
  const CardItem({required this.assetImage, required this.title, required this.price, required this.genre});
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
List<Comics> comicsList = [
  Comics(
    name: 'Spider-Man',
    pages: 32,
    genre: 'Action',
    assets: 'assets/spiderman.png',
  ),
  Comics(
    name: 'Batman',
    pages: 28,
    genre: 'Action',
    assets: 'assets/batman.png',
  ),
  Comics(
    name: 'X-Men',
    pages: 36,
    genre: 'Action',
    assets: 'assets/xmen.png',
  ),
];
List<CardItem> items = [
  CardItem(
    assetImage: 'assets/spiderman.png',
    title: 'The Amazing Spiderman',
    price: '\$ 66',
    genre: 'Action',
  ),
  CardItem(
    assetImage: 'assets/xmen.png',
    title: 'The X-men',
    price: '\$ 45',
    genre: 'Action',
  ),
  CardItem(
    assetImage: 'assets/batman.png',
    title: 'Batman 2',
    price: '\$ 49',
    genre: 'Action',
  ),
];

// ThemeData(brightness: darkTheme ? Brightness.dark : Brightness.light)