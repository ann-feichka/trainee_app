import 'package:flutter/material.dart';
import 'package:movie_app/item_interceptor.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

class MoviesListWidget extends StatefulWidget {
  final List<Movie> movies;
  final bool isLandscape;
  final ItemInterceptor itemInterceptor;
  final int? selectedIndex;

  const MoviesListWidget(
      {Key? key,
      required this.movies,
      required this.isLandscape,
      required this.itemInterceptor,
      this.selectedIndex})
      : super(key: key);

  @override
  _MoviesListWidgetState createState() => _MoviesListWidgetState();
}

class _MoviesListWidgetState extends State<MoviesListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.movies.length,
      itemBuilder: (BuildContext context, int index) {
        Movie movie = widget.movies[index];
        return Container(
            color: widget.selectedIndex != null && widget.selectedIndex == index
                ? Colors.deepOrangeAccent
                : null,
            child: InkWell(
                onTap: () {
                  widget.isLandscape
                      ? widget.itemInterceptor.onClickLandscape(movie.id)
                      : widget.itemInterceptor.onClickPortrait(movie.id);
                },
                child: MovieCard(
                  movie: movie,
                  isLandscape: widget.isLandscape,
                )));
      },
    );
  }
}
