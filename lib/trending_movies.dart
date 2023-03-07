// ignore_for_file: prefer_interpolation_to_compose_strings, must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';

import 'package:movie_app/utils/constants.dart';

class TrendingMovies extends StatelessWidget {
  List trending;
  TrendingMovies({super.key, required this.trending});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ModifiedText(
          text: 'Trending ',
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescScreen(
                                    poster: 'https://image.tmdb.org/t/p/w500' +
                                        trending[index]['poster_path'],
                                    backdrop:
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path'],
                                    title: trending[index]['title'] ??
                                        trending[index]['name'],
                                    description: trending[index]['overview'],
                                    rating: trending[index]['vote_average']
                                        .toString(),
                                    released: trending[index]['release_date'] ??
                                        "loading",
                                    budget:
                                        trending[index]['budget'] ?? "loading",
                                    lang: trending[index]
                                            ['original_language'] ??
                                        "loading",
                                    status:
                                        trending[index]['status'] ?? "loading",
                                  )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            trending[index]['backdrop_path']))),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        Colors.black.withOpacity(0.8),
                                        Colors.black.withOpacity(0.2)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      stops: [0.002, 0.95])),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: 12.0,
                                    left: 8,
                                  ),
                                  child: ModifiedText(
                                    text: trending[index]['title'] ??
                                        trending[index]['name'],
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  );
                }))
      ]),
    );
  }
}
