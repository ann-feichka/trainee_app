import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_response.dart';
import 'package:movie_app/model/popular_movie_response.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

typedef void IdCallback(int id);

class MoviesListWidget extends StatefulWidget {
  final PopularMovieResponse movies;
  final IdCallback idCallback;
  final int? selectedIndex;
  final bool isHighlited;

  const MoviesListWidget(
      {Key? key,
      required this.movies,
      this.selectedIndex,
      required this.idCallback,
      required this.isHighlited})
      : super(key: key);

  @override
  State<MoviesListWidget> createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      controller: controller,
      itemCount: widget.movies.movies.length,
      itemBuilder: (BuildContext context, int index) {
        MovieResponse movie = widget.movies.movies[index];
        return Container(
            color: widget.isHighlited == true &&
                    widget.selectedIndex != null &&
                    widget.selectedIndex == index
                ? Colors.deepOrangeAccent
                : null,
            child: MovieCard(
              movie: movie,
              idCallback: widget.idCallback,
            ));
      },
    );
  }
}
