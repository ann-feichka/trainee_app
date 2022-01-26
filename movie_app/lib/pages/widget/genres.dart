

import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

import 'genre_card.dart';

class Genres extends StatelessWidget {
  final Movie movie;
  const Genres({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movie.genre.length,
        itemBuilder: (context, index) => GenreCard(
          genre: movie.genre[index],
        ),
      ),
    );
  }
}
