// ignore_for_file: prefer_const_constructors
class CardItem {
  final String assetImage;
  final String title;
  final String price;
  final String genre;
  const CardItem({required this.assetImage, required this.title, required this.price, required this.genre});
}

List<CardItem> items = [
  CardItem(
    assetImage: 'assets/batman.png',
    title: 'Batman 2',
    price: '\$ 49',
    genre: 'Adventure',
  ),
  CardItem(
    assetImage: 'assets/spiderman.png',
    title: 'The Amazing Spiderman',
    price: '\$ 66',
    genre: 'Adventure',
  ),
  CardItem(
    assetImage: 'assets/xmen.png',
    title: 'The X-men',
    price: '\$ 45',
    genre: 'Adventure',
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
];
