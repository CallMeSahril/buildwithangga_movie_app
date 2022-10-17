import 'package:buildwithangga_movie_app/common/constants.dart';
import 'package:buildwithangga_movie_app/data/model/movie.dart';
import 'package:buildwithangga_movie_app/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchPage extends StatefulWidget {
  static String routeName = '/search_page';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> allMovie = dataMovie;

  void searchMovie(String query) {
    final movieFilter = dataMovie.where((movie) {
      final movieTitle = movie.title.toLowerCase();
      final input = query.toLowerCase();
      return movieTitle.contains(input);
    }).toList();
    setState(() {
      allMovie = movieFilter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFD),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kTitle,
        label: const Text('Suggest Movie'),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Coming Soon'),
              content: const Text('Sedang Dalam Perbaikan'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: TextField(
                onChanged: searchMovie,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search Tech Talk',
                ),
              ),
            ),
            (allMovie == 0)
                ? const Text("Data Kosong")
                : Expanded(
                    child: ListView.builder(
                        itemCount: allMovie.length,
                        itemBuilder: (context, index) {
                          final movie = allMovie[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, DetailPage.routeName,
                                  arguments: movie);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              height: 127,
                              width: 235,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 125,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(movie.images),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(21)),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie.title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: kTitle,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        movie.subTitle,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: kSubTitle,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RatingBar.builder(
                                          initialRating: movie.idb.toDouble(),
                                          itemCount: 5,
                                          itemSize: 18,
                                          itemBuilder: (context, index) {
                                            return Icon(
                                              Icons.star,
                                              color: kLogoColor,
                                            );
                                          },
                                          onRatingUpdate: (rating) {})
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
          ],
        ),
      )),
    );
  }
}
