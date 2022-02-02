import 'package:flutter/material.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

class MoviesListWidget extends StatelessWidget {
  final List<Movie> movies;
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;

  const MoviesListWidget(
      {Key? key,
      required this.movies,
      required this.isLandscape,
      required this.itemInterceptor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = movies[index];
        return Container(
            child: InkWell(
                onTap: () {
                  isLandscape
                      ? itemInterceptor.onClickLandscape(movie.id)
                      : itemInterceptor.onClickPortrait(movie.id);
                },
                child: MovieCard(
                  movie: movie,
                  isLandscape: isLandscape,
                )));
      },
    );
  }
}
