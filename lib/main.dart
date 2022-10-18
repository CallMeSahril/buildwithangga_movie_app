import 'package:buildwithangga_movie_app/data/model/movie.dart';
import 'package:buildwithangga_movie_app/pages/detail_page.dart';
import 'package:buildwithangga_movie_app/pages/home_page.dart';
import 'package:buildwithangga_movie_app/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: ThemeData(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SearchPage.routeName: (context) => const SearchPage(),
        DetailPage.routeName: (context) => DetailPage(
              movie: ModalRoute.of(context)?.settings.arguments as Movie,
            )
      },
    );
  }
}
