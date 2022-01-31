import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/details_bloc/details_bloc.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/routes.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

class MoviesList extends StatefulWidget {
  final List<Movie> movies;
  final bool isLandscape;
  final Function onTap;

  const MoviesList(
      {Key? key,
      required this.movies,
      required this.isLandscape,
      required this.onTap})
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
                  widget.isLandscape
                      ? _fetchDetails(context, movie.id)
                      : _navigateToDetailsPage(context, movie.id);
                },
                child: MovieCard(
                  movie: movie,
                  isLandscape: widget.isLandscape,
                )));
      },
    );
  }
}

_fetchDetails(BuildContext context, int id) {
  BlocProvider.of<MovieDetailBloc>(context).add(MovieDetailFetchEvent(id));
}

_navigateToDetailsPage(BuildContext context, int id) {
  Navigator.of(context).pushNamed(detailsPageBloc, arguments: id);
}
