import 'package:flutter/material.dart';
import 'package:movie_app/inherited_selector.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/model/popular_movie_model.dart';
import 'package:movie_app/view/widget/card/movie_card.dart';

typedef void IdCallback(int id);

class MoviesListWidget extends StatefulWidget {
  final PopularMovieModel movies;
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
      itemCount: widget.movies.movies?.length,
      itemBuilder: (BuildContext context, int index) {
        MovieModel movie = widget.movies.movies![index];
        int? _id = InheritedSelector.of(context);
        int? _selectIndex =
            widget.movies.movies?.indexWhere((element) => element.id == _id);
        return Container(
            color: widget.isHighlited == true &&
                    _selectIndex != null &&
                    _selectIndex == index
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
