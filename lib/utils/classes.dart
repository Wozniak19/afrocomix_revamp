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
    genre: 'Superhero',
    assets: 'assets/spiderman.jpg',
  ),
  Comics(
    name: 'Big Nate',
    pages: 89,
    genre: 'Comedy',
    assets: 'assets/bignate.jpg',
  ),
  Comics(
    name: 'Batman',
    pages: 28,
    genre: 'Superhero',
    assets: 'assets/batman.jpg',
  ),
  Comics(
    name: 'Boondocks',
    pages: 15,
    genre: 'Lifestyle',
    assets: 'assets/boondocks.jpg',
  ),
  Comics(
    name: 'X-Men',
    pages: 36,
    genre: 'Superhero',
    assets: 'assets/x_men.jpg',
  ),
  // Add more comic instances with online image links here.
];
