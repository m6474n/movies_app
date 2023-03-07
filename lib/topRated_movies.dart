// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/constants.dart';

class TopRatedMovies extends StatelessWidget {
  final List topRated;
  const TopRatedMovies({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ModifiedText(
          text: 'Top Rated Movies',
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topRated.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescScreen(
                                    poster: 'https://image.tmdb.org/t/p/w500' +
                                        topRated[index]['poster_path'],
                                    backdrop:
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['backdrop_path'],
                                    title: topRated[index]['title'] ??
                                        topRated[index]['name'],
                                    description: topRated[index]['overview'],
                                    rating: topRated[index]['vote_average']
                                        .toString(),
                                    released: topRated[index]['release_date'] ??
                                        "loading",
                                    budget:
                                        topRated[index]['budget'] ?? "loading",
                                    lang: topRated[index]
                                            ['original_language'] ??
                                        "loading",
                                    status:
                                        topRated[index]['status'] ?? "loading",
                                  )));
                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            topRated[index]['poster_path']))),
                          ),
                          ModifiedText(
                            text: topRated[index]['title'] ?? 'Loading...',
                            color: Colors.white,
                            size: 14,
                          )
                        ],
                      ),
                    ),
                  );
                }))
      ]),
    );
  }
}
