import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/topRated_movies.dart';
import 'package:movie_app/trending_movies.dart';
import 'package:movie_app/tv_show.dart';

import 'package:movie_app/utils/constants.dart';
import 'package:tmdb_api/tmdb_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List tv = [];
  String apiKey = '69384e9d896d41ec84402eb505ac8266';
  String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OTM4NGU5ZDg5NmQ0MWVjODQ0MDJlYjUwNWFjODI2NiIsInN1YiI6IjY0MDZlM2FjZjg1OTU4MDA3ODkzMzQzYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OB2osE-zUzkYczA0_2b7dkMjYdciYUtGUSLWoKOMrAY';

  @override
  void initState() {
    loadMovies();

    // TODO: implement initState
    super.initState();
  }

  Future loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
        logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true));

    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResults = await tmdbWithCustomLogs.v3.tv.getPopular();

    setState(() {
      trendingMovies = trendingResults['results'];
      topRatedMovies = topRatedResults['results'];
      tv = tvResults['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ModifiedText(
          text: 'Movies App',
          color: Colors.white,
          size: 20,
        ),
      ),
      body: ListView(children: [
        TrendingMovies(trending: trendingMovies),
        TopRatedMovies(topRated: topRatedMovies),
        TvShows(shows: tv)
      ]),
    );
  }
}
