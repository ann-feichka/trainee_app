import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view/page/details_page.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

class MoviesList extends StatefulWidget {
  final List<Movie> movies;
  final bool isBloc;
  final bool isLandscape;

  const MoviesList(
      {Key? key,
      required this.movies,
      required this.isBloc,
      required this.isLandscape})
      : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = widget.movies[index];
        return Container(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(detailsPage,
                      arguments: MovieDetailsArguments(
                          isBloc: widget.isBloc, movieId: movie.id));
                },
                child: MovieCard(
                  movie: movie,
                  isLandscape: widget.isLandscape,
                )));
      },
    );
  }
}
