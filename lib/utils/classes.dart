// ignore_for_file: prefer_const_constructors
class CardItem {
  final String assetImage;
  final String title;
  final String subtitle;
  const CardItem({required this.assetImage, required this.title, required this.subtitle});
}

List<CardItem> items = [
  CardItem(
    assetImage: 'assets/batman.png',
    title: 'Batman 2',
    subtitle: '\$ 49',
  ),
  CardItem(
    assetImage: 'assets/spiderman.png',
    title: 'The Amazing Spiderman',
    subtitle: '\$ 66',
  ),
  CardItem(
    assetImage: 'assets/xmen.png',
    title: 'The X-men',
    subtitle: '\$ 45',
  ),
];

class Comics {
  final String name;
  final int pages;
  final String genre;
  final String assets;

  Comics({required this.name, required this.pages, required this.genre, required this.assets});
}

List<Comics> comicsList = [
  Comics(
    name: 'Spider-Man',
    pages: 32,
    genre: 'Adventure',
    assets: 'assets/spiderman.png',
  ),
  Comics(
    name: 'Batman',
    pages: 28,
    genre: 'Superhero',
    assets: 'assets/batman.png',
  ),
  Comics(
    name: 'X-Men',
    pages: 36,
    genre: 'Superhero',
    assets: 'assets/xmen.png',
  ),
  // Add more comic instances with online image links here.
];
