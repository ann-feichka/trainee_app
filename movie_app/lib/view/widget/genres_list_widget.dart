import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_response.dart';

import 'card/genre_card.dart';

class GenresList extends StatelessWidget {
  final MovieResponse movie;

  const GenresList({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: movie.genres!.length,
        itemBuilder: (context, index) => GenreCard(
          genre: movie.genres![index],
        ),
      ),
    );
  }
}
