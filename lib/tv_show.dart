// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/constants.dart';

class TvShows extends StatelessWidget {
  final List shows;
  const TvShows({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const ModifiedText(
          text: 'Popular TV Shows',
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
                itemCount: shows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DescScreen(
                                    poster: 'https://image.tmdb.org/t/p/w500' +
                                        shows[index]['poster_path'],
                                    backdrop:
                                        'https://image.tmdb.org/t/p/w500' +
                                            shows[index]['backdrop_path'],
                                    title: shows[index]['title'] ??
                                        shows[index]['name'],
                                    description: shows[index]['overview'],
                                    rating:
                                        shows[index]['vote_average'].toString(),
                                    released: shows[index]['release_date'] ??
                                        "loading",
                                    budget: shows[index]['budget'] ?? "loading",
                                    lang: shows[index]['original_language'] ??
                                        "loading",
                                    status: shows[index]['status'] ?? "loading",
                                  )));
                    },
                    child: SizedBox(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500' +
                                            shows[index]['poster_path']))),
                          ),
                          ModifiedText(
                            text: shows[index]['name'] ?? 'Loading...',
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
