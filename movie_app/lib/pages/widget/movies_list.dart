
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

import 'card_movies.dart';

class MoviesList extends StatelessWidget {

  final List<Movie> movies;
  final bool isBloc;
  final bool isLandscape;
  final onTap;
  const MoviesList({Key? key, required this.movies, required this.isBloc,required this.isLandscape, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movies[index];
        return CardMovies(movie: movie,isBloc: isBloc,isLandscape: isLandscape,onTap: onTap,);
      },
    );
  }
}
