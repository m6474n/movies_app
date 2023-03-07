import 'package:flutter/material.dart';
import 'package:movie_app/utils/constants.dart';

class DescScreen extends StatelessWidget {
  final String poster;
  final String backdrop;
  final String title;
  final String description;
  final String rating;
  final String released;
  final String status;
  final String lang;
  final String budget;

  const DescScreen(
      {super.key,
      required this.poster,
      required this.backdrop,
      required this.title,
      required this.description,
      required this.rating,
      required this.released,
      required this.status,
      required this.lang,
      required this.budget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            Positioned(
                child: Container(
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(backdrop))),
              child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.transparent, Colors.black],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter))),
            )),
            // Positioned(child: Image.network(backdrop)),
            Positioned(
              bottom: 30,
              left: 10,
              child: ModifiedText(
                text: '⭐ Average rating -  $rating',
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: ModifiedText(text: title, color: Colors.white, size: 30),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                child: Image.network(poster),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ModifiedText1(
                      text: 'Status: $status', color: Colors.white, size: 16),
                  const SizedBox(
                    height: 4,
                  ),
                  ModifiedText1(
                      text: 'Released on: $released',
                      color: Colors.white,
                      size: 16),
                  const SizedBox(
                    height: 4,
                  ),
                  ModifiedText1(
                      text: 'Language: $lang', color: Colors.white, size: 16),
                  const SizedBox(
                    height: 4,
                  ),
                  ModifiedText1(
                      text: 'Budget: $budget', color: Colors.white, size: 16),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Flexible(
              child: ModifiedText1(
            text: description,
            color: Colors.white,
            size: 16,
          )),
        )
      ]),
    );
  }
}
