import 'package:buildwithangga_movie_app/common/constants.dart';
import 'package:buildwithangga_movie_app/data/model/movie.dart';
import 'package:buildwithangga_movie_app/pages/detail_page.dart';
import 'package:buildwithangga_movie_app/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Movie> datamovie = dataMovie;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: CustomScrollView(
            slivers: [
              _buildAppBar(context),
              _buildListHorizontal(context, datamovie),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "From Disney",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              _buildListVertical(datamovie),
            ],
          ),
        ),
      ),
    );
  }

  SliverList _buildListVertical(List<Movie> datamovie) {
    return SliverList(
        delegate: SliverChildBuilderDelegate(
      (context, index) {
        final movie = datamovie[index];
        return GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, DetailPage.routeName,
                arguments: movie);
          }),
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
                          image: AssetImage(movie.images), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(21)),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                )
              ],
            ),
          ),
        );
      },
      childCount: datamovie.length,
    ));
  }

  SliverToBoxAdapter _buildListHorizontal(
      BuildContext context, List<Movie> datamovie) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: datamovie.length,
                itemBuilder: (context, index) {
                  final movie = datamovie[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DetailPage.routeName,
                          arguments: movie);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 279,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(movie.images),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.title,
                                    style: TextStyle(
                                        color: kTitle,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    movie.subTitle,
                                    style: TextStyle(color: kSubTitle),
                                  ),
                                ],
                              ),
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
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 110,
      elevation: 0,
      backgroundColor: Colors.white,
      flexibleSpace: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Moviez",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Watch much easier",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchPage.routeName);
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
