class Movie {
  final String title;
  final String subTitle;
  final String images;
  final int idb;

  Movie(
      {required this.title,
      required this.images,
      required this.idb,
      required this.subTitle});
}

List<Movie> dataMovie = [
  Movie(
      title: 'John Wick',
      images: 'assets/images/movie1.png',
      idb: 5,
      subTitle: 'Action, Crime'),
  Movie(
      title: 'Bohemian',
      images: 'assets/images/movie3.png',
      idb: 3,
      subTitle: 'Documentary'),
  Movie(
      title: 'Mulan Session',
      images: 'assets/images/movie2.png',
      idb: 3,
      subTitle: 'History, War'),
  Movie(
      title: 'Beauty & Beast',
      images: 'assets/images/movie4.png',
      idb: 5,
      subTitle: 'Sci-Fiction'),
  Movie(
      title: 'The Dark II',
      images: 'assets/images/movie5.png',
      idb: 4,
      subTitle: 'Horror'),
  Movie(
      title: 'The Dark Knight',
      images: 'assets/images/movie6.png',
      idb: 5,
      subTitle: 'Heroes'),
  Movie(
      title: 'The Dark Tower',
      images: 'assets/images/movie7.png',
      idb: 4,
      subTitle: 'Action'),
];
