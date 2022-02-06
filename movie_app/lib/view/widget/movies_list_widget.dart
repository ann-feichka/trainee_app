import 'package:flutter/material.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie_preview.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

class MoviesListWidget extends StatelessWidget {
  final PopularMovieResponse movies;
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  final ScrollController? controller;
  final int? selectedIndex;

  const MoviesListWidget(
      {Key? key,
      required this.movies,
      required this.isLandscape,
      required this.itemInterceptor,
      this.selectedIndex,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView.builder(
          scrollDirection: Axis.vertical,
          controller: controller,
          itemCount: movies.movies.length,
          itemBuilder: (BuildContext context, int index) {
            MoviePreview movie = movies.movies[index];
            return Container(
                color: selectedIndex != null && selectedIndex == index
                    ? Colors.deepOrangeAccent
                    : null,
                child: InkWell(
                    onTap: () {
                      isLandscape
                          ? itemInterceptor.onClickLandscape(movie.id!)
                          : itemInterceptor.onClickPortrait(movie.id!);
                    },
                    child: MovieCard(
                      movie: movie,
                      isLandscape: isLandscape,
                    )));
          },
        ),
      ],
    );
  }
}
