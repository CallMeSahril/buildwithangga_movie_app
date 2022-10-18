import 'package:buildwithangga_movie_app/common/constants.dart';
import 'package:buildwithangga_movie_app/data/model/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;
  static String routeName = '/detail_page';

  const DetailPage({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            movie.title,
            style: const TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(movie.images), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                ),
                const SizedBox(height: 20),
                Text(
                  movie.title,
                  style: TextStyle(
                      color: kTitle, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  movie.subTitle,
                  style: TextStyle(color: kSubTitle),
                ),
                const SizedBox(height: 5),
                RatingBarIndicator(
                  rating: movie.idb.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 18.0,
                  direction: Axis.horizontal,
                ),
                const SizedBox(height: 5),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
